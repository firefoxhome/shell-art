#!/bin/bash

function add() {
    ret=$(expr $1 + $2)
    return $ret
}

mutil () {
    ret=`expr $1 \* $2`
    return $ret
}

add 1 2
echo "function add return $?"

mutil 1 2
echo "function mutil return $?"
