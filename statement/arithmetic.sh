#!/bin/bash
# datas arithmetic

# let
n=3
let n=n+5
echo "n = $n"

let n=n*10
echo "n = $n"

let n=n/8
echo "n = $n"

let n=n**2
echo "n = $n"

# expr
m=`expr 4 + 5`
echo "m = $m"

m=`expr $m \* 10`
echo "m = $m"

# $(())
r=$((4 + 5))
echo "r = $r"

r=$(($r + 5))
echo "r = $r"

# $[]
s=$[4 + 5]
echo "s = $s"

s=$[$s * 10]
echo "s = $s"

s=$[$s / 9]
echo "s = $s"
