#!/bin/bash

cnt=2

str=$@

# First split way, if there are null strings that it will faild
#array=(${str//,/ })

# Second split way
array=`echo $str | cut -d \, -f 7`

echo ${array}

for i in ${array[@]}
do
    echo $i;
done
