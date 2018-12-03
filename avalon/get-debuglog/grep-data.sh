#!/bin/bash

cnt=1
while true
do
    cat debuglog-${cnt} | sed 's/] /\]\n/g' | grep $1 | sed 's/'$1'\[//g' | sed 's/\]//g'
    let cnt=cnt+1
    if [ $cnt == 96 ]; then
        break
    fi
done
