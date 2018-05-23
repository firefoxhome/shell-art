#!/bin/bash

idirname=$(date +%Y%m%d%H%M)

mkdir $dirname

cat ip_freq_voltlevel.config | awk 'NR>1' | while read IP FREQ VOLT_LEVEL
do
	ssh -n root@$IP cgminer-api debug > debug.log
	num=`cat debug.log | grep "\[Debug\] => true" | wc -l`
	rm debug.log

	if [ $num -eq 0 ]
	then
		ssh -n root@$IP cgminer-api "\"debug|D\"" > /dev/null
	fi

	ssh -n root@$IP cgminer-api estats  | grep "\[MM ID" > ./$dirname/"CGMiner_Debug_"$IP"_"$FREQ"M_Level"$VOLT_LEVEL".log"
	ssh -n root@$IP cgminer-api edevs   | grep -v Reply  > ./$dirname/"CGMiner_Edevs_"$IP"_"$FREQ"M_Level"$VOLT_LEVEL".log"
	ssh -n root@$IP cgminer-api summary | grep -v Reply  > ./$dirname/"CGMiner_Summy_"$IP"_"$FREQ"M_Level"$VOLT_LEVEL".log"

	echo $IP $FREQ $VOLT_LEVEL
done
