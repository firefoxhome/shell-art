#!/bin/bash

# sed (stream editor): sed is not interactive stream editor
# -i: modify origin file

# -e:  modify output
sed -e 's/this/That/g' -e 's/line/LINE/g' file_name

# delete frist line
sed '1d' file_name
# change origin file
sed -i '1d' file_name

sed '1, 5d' file_name

# delete to the last line
sed '1, $d' file_name

# delete 'test' lines
sed '/test/d' file_name

# delete null lines
sed '^$/d' file_name

# replace
sed 's/line/word/g' file_name
# only replace first 'this'
sed 's/^this/that/g' file_name

# y: transfer words
sed 'y/123456/abcdef/' file_name

# i(before insert)/a(after insert) insert words
sed '2 i Insert' file_name
sed '2 a Insert' file_name

# r:  read other files
sed '/^$/r /etc/passwd' file_name

# print files line, -n: don't print other lines
sed -n '1p' file_name
sed -n 's/the/an/p' file_name

# w also write the file
sed -n '1, 2 w output' file_name

# replace next line, using n
sed '/^$/{n;s/line/word/g}' file_name
