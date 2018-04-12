#!/bin/bash

IP=`cat ip-freq-voltlevel-devid.config | sed -n '2p' | awk '{ print $1 }'`
DATE=`date +%Y%m%d%H%M`
dirname=$IP"-"$DATE"-"$2"-"$4"-"$6"-"$8
mkdir $dirname

cat estats.log  | grep "\[MM ID" > ./$dirname/CGMiner_Debug.log
cat edevs.log | grep -v Reply  > ./$dirname/CGMiner_Edevs.log
cat summary.log | grep -v Reply  > ./$dirname/CGMiner_Summary.log

rm estats.log edevs.log summary.log
cd ./$dirname

echo "$2" > freq.log
echo "$4" > voltage.log

for i in CGMiner_Debug.log
do
    cat $i | sed 's/] /\]\n/g' | grep GHSmm | sed 's/GHSmm\[//g' | sed 's/\]//g' > $i.GHSmm
    cat $i | sed 's/] /\]\n/g' | grep Temp  | sed 's/Temp\[//g'  | sed 's/\]//g' > $i.Temp
    cat $i | sed 's/] /\]\n/g' | grep TMax  | sed 's/TMax\[//g'  | sed 's/\]//g' > $i.TMax
    cat $i | sed 's/] /\]\n/g' | grep WU    | sed 's/WU\[//g'    | sed 's/\]//g' > $i.WU
    cat $i | sed 's/] /\]\n/g' | grep DH    | sed 's/DH\[//g'    | sed 's/\]//g' > $i.DH
    cat $i | sed 's/] /\]\n/g' | grep "Cout\["    | sed 's/Cout\[//g'    | sed 's/\]//g' > $i.Cout
    cat $i | sed 's/] /\]\n/g' | grep V0 | awk '{ print $3}' > $i.V0

    # Power
    cout=`cat $i.Cout`
    vo=`cat $i.V0`
    power=$(echo "scale=1;$vo * $cout / 1000 / 100" | bc)
    #let power=vo*cout/1000/100*0.1
    echo $power > $i.Power

    # According to WU value, calculate GHSav.
    # Formula: ghsav = WU / 60 * 2^32 /10^9
    cat $i.WU | awk '{printf ("%.2f\n", ($1/60*2^32/10^9))}' > $i.GHSav

    Result=Results_$dirname

    paste -d, freq.log voltage.log $i.GHSmm $i.Temp $i.TMax $i.WU $i.GHSav $i.DH $i.Cout $i.V0 $i.Power  > ${Result#.log}.csv
    cat *.csv >> ../miner-result.csv

    rm -rf $i.GHSmm $i.Temp $i.TMax $i.WU $i.GHSav $i.DH freq.log voltage.log $i.Cout $i.V0

    cd ..
    mv ./$dirname ./result*
done
