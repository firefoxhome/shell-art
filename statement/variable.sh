#!/bin/bash

# define variable
name='name'
name_file='name_file'
number123='number123'
echo ${name} ${name_file} ${number123}

# modify variable value
name="nametest"
echo ${name}

# format one
for file in `ls`; do echo $file; done

# format two
for file in $(ls); do echo ${file}; done

# single and double quotation mark
# double quotation can output variable, but single quotation can not output
double_q="hello ${name} \n"
echo ${double_q}

# string length
echo ${#double_q}

# shell array
array=('test1' 'test2' 'test3')
echo ${array[0]}
echo ${array[@]}

# code note
# It can use to define function, making code note
