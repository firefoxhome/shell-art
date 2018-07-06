#!/bin/bash

cnt=2

str=`sed -n "${cnt}p" test`
array=(${str//,/ })

echo ${array[0]}

for i in ${array[@]}
do
    echo $i;
done
