#!/bin/bash

count=1

echo "------------------------------ Running ------------------------------"

while true
do
    sleep 300

    ./ssh-debuglog.py $1 > debuglog-${count}
    echo "------------------------------ debuglog-${count} ------------------------------"

    let count=count+1
done
