#!/bin/bash

sleep 10 &
sleep 20 &
sleep 30 &

while true
do
    cnt=`ps -ef | grep sleep | wc -l`
    if [ $cnt -le '1' ]; then
        echo -e "\033[1;32m++++++++++++++++++++++++++++++  Done   ++++++++++++++++++++++++++++++\033[0m"
        break
    fi

    sleep 3
    echo "++++++++++++++++++++++++++++++ Running ++++++++++++++++++++++++++++++"
done
