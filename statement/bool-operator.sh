#!/bin/bash
#
# bool operator: !, -o(or), -a(and)
#

a=10

if [ ! $a -gt 50 ]; then
    echo "!false = true"
fi

if [ $a -gt 30 -o $a -lt 15 ]; then
    echo "a > 30 or a < 15"
fi

if [ $a -gt 5 -a $a -lt 15 ]; then
    echo "a > 5 and a < 15"
fi
