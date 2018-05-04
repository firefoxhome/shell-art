#!/bin/bash

a=10

if [[ $a -gt 5 && $a -lt 15 ]]; then
    echo "a > 5 && a < 15"
fi

if [[ $a -gt 15 || $a -lt 20 ]]; then
    echo "a > 15 || a < 20"
fi
