#!/bin/bash

dirname=$(date +%Y%m%d%H%M)

mkdir $dirname

cat ip_freq_voltlevel.config | awk 'NR>1' | while read IP FREQ VOLT_LEVEL
do
	/usr/bin/expect <<-EOF
		set timeout 20
		spawn ssh root@$IP
		expect "*password:"
		send "1\r"
		expect "*#"
		send "cgminer-api debug > ./debug.log\r"
		expect "*#"
		send "exit\r"
		interact
		expect eof
	EOF

	/usr/bin/expect <<-EOF
		set timeout 20
		spawn scp root@$IP:/root/debug.log ./
		expect "*password:"
		send "1\r"
		interact
		expect eof
	EOF

	num=`cat debug.log | grep "\[Debug\] => true" | wc -l`
	rm ./debug.log

	if [ $num -eq 0 ]
	then
		/usr/bin/expect <<-EOF
			set timeout 20
			spawn ssh root@$IP
			expect "*password:"
			send "1\r"
			expect "*#"
			send "cgminer-api \"debug|D\"\r"
			expect "*#"
			send "exit\r"
			interact
			expect eof
		EOF
	fi

	/usr/bin/expect <<-EOF
		set timeout 20
		spawn ssh root@$IP
		expect "*password:"
		send "1\r"
		expect "*#"
		send "cgminer-api estats > ./estats.log\r"
		expect "*#"
		send "cgminer-api edevs   | grep -v Reply    > ./edevs.log\r"
		expect "*#"
		send "cgminer-api summary | grep -v Reply    > ./summy.log\r"
		expect "*#"
		send "exit\r"
		interact
		expect eof
	EOF

	/usr/bin/expect <<-EOF
		set timeout 20
		spawn scp root@$IP:/root/*.log ./
		expect "*password:"
		send "1\r"
		interact
		expect eof
	EOF

	/usr/bin/expect <<-EOF
		set timeout 20
		spawn ssh root@$IP
		expect "*password:"
		send "1\r"
		expect "*#"
		send "rm *.log\r"
		expect "*#"
		send "exit\r"
		interact
		expect eof
	EOF

	cat estats.log | grep "\[MM ID" > debug.log
	rm ./estats.log

	mv ./debug.log ./$dirname/"CGMiner_Debug_"$IP"_"$FREQ"M_Level"$VOLT_LEVEL".log"
	mv ./edevs.log ./$dirname/"CGMiner_Edevs_"$IP"_"$FREQ"M_Level"$VOLT_LEVEL".log"
	mv ./summy.log ./$dirname/"CGMiner_Summy_"$IP"_"$FREQ"M_Level"$VOLT_LEVEL".log"

	echo $IP $FREQ $VOLT_LEVEL
done
