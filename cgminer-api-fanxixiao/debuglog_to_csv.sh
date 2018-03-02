#!/bin/bash

for i in CGMiner_Debug_*.log
do

	cat $i | sed 's/\] /\]\n/g' | grep GHSmm| sed 's/GHSmm\[//g' | sed 's/\]//g' > $i.GHSmm
	cat $i | sed 's/\] /\]\n/g' | grep Temp | sed 's/Temp\[//g'  | sed 's/\]//g' > $i.Temp
	cat $i | sed 's/\] /\]\n/g' | grep TMax | sed 's/TMax\[//g'  | sed 's/\]//g' > $i.TMax
	cat $i | sed 's/\] /\]\n/g' | grep WU   | sed 's/WU\[//g'    | sed 's/\]//g' > $i.WU

	# according to WU value, calculate GHSav.
	# formula: ghsav = WU / 60 * 2^32 /10^9
	cat $i.WU | awk '{printf ("%.2f\n", ($1/60*2^32/10^9))}' > $i.GHSav

	Power=CGMiner_Power_${i#*Debug_}
	Resut=Results_${i#*Debug_}

	paste $i.GHSav $Power | awk '{printf ("%.3f\n", ($2/$1))}' > ph.log

	echo "GHSmm,Temp,TMax,WU,GHSav,Power,PE" > ${Resut#.log}.csv
	paste -d, $i.GHSmm $i.Temp $i.TMax $i.WU $i.GHSav $Power ph.log >> ${Resut#.log}.csv

	rm $i.GHSmm $i.Temp $i.TMax $i.WU $i.GHSav ph.log
done
