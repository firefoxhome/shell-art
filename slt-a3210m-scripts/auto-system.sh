#!/bin/bash

# Create result.csv
echo "Freq,Voltage,GHSmm,Temp,TMax,WU,GHSav,DH,Cout,Vo,Power,Power/GHSav" > miner-result.csv

# Get raspberry IP address
IP=`cat ip-freq-voltlevel-devid.config | sed -n '2p' | awk '{ print $1 }'`
./scp-login.exp $IP 0
sleep 3

# Create result directory
dirip="result-"$IP
mkdir $dirip

# Config /etc/config/cgminer and restart cgminer, Get Miner debug logs
cat ip-freq-voltlevel-devid.config | grep avalon |  while read tmp
do
    more_options=`cat cgminer | grep more_options`
    if [ "$more_options" == "" ]; then
        echo "option more_options" >> cgminer
    fi

    more_options=`cat cgminer | grep more_options`
    sed -i "s/$more_options/	option more_options '$tmp'/g" cgminer

    # Cp cgminer to /etc/config
    ./scp-login.exp $IP 1
    sleep 3

    # CGMiner restart
    ./ssh-login.exp $IP /etc/init.d/cgminer restart
    sleep 900

    # SSH no password
    ./ssh-login.exp $IP cgminer-api "debug\|D" > /dev/null
    sleep 1
    ./ssh-login.exp $IP cgminer-api estats estats.log > /dev/null
    ./ssh-login.exp $IP cgminer-api edevs edevs.log > /dev/null
    ./ssh-login.exp $IP cgminer-api summary summary.log > /dev/null

    # Read CGMiner Log
    ./read-debuglog.sh $tmp
done

# Remove cgminer file
rm cgminer
