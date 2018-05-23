#!/bin/bash

a=30
b=8

div=$(echo "scale=6; $a / $b" | bc)
echo $div

div=`echo $a | awk '{ printf ("%.3f\n", $1 / 4) }'`
echo $div
