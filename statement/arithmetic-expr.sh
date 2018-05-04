#!/bin/bash

# Aritchmetic expr
a=10
b=20

val=`expr $a + $b`
echo "a + b = $val"

val=$(expr $a - $b)
echo "a - b = $val"

val=`expr $a \* $b`
echo "a * b = $val"

val=$(expr $a / $b)
echo "a / b = $val"

val=`expr $a % $b`
echo "a % b = $val"

if [ $a == $b ]; then
    echo "a == b"
elif [ $a != $b ]; then
    echo "a != b"
fi
