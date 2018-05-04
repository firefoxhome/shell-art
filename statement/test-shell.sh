#!/bin/bash

a=10
b=20

# test operator
if test $a -eq $b; then
    echo "a = b"
else
    echo "a != b"
fi

# $[] operator
c=$[a + b]
echo "a + b = $c"

d=$[a * b]
echo "a * b = $d"
