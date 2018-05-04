#!/bin/bash

# string operator: =, !=, -z, -n, str

a='123'
b='456'

if [ $a = $b ]; then
    echo "a = b"
fi

if [ $a != $b ]; then
    echo "a != b"
fi

if [ -z $a ]; then
    echo "string a is null"
fi

if [ -n $b ]; then
    echo "string b is not null"
fi

if [ $a ]; then
    echo "a is not null"
fi

if [ $b ]; then
    echo "b is not null"
fi
