#!/bin/bash
# domain blocks

# $0 is all blocks
awk '{print $1, $4}' file_name
awk '{print $0}' file_name

# -F '.' is separator
awk -F. '{print $1, $1}' file_name

# NF get column
awk '{print NF}' file_name
awk -F. '{print NF}' file_name

# $NF is the last column
awk '{print $NF}' file_name
awk '{print $(NF-1)}' file_name

# substr()
cat file_name | awk '{print substr($1, 6)}'

# lenght is the string lenght
cat file_name | awk '{print lenght}'

# sum
cat file_name | awk 'DEBIN{total=0}{total+=$3}END{print total}'
