#!/bin/bash

count=1

while true
do
    ./ssh-debuglog.py $1 > debuglog-${count}
    sleep 10
    let count=count+1
done
