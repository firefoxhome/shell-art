#!/bin/bash

# Judging parameter, if it is null
if [ -n "$1" ]; then
    echo "It has the parameter."
else
    echo "It don't have the parameter."
fi

# Pass parameter symbol
# $# lenght
echo "$#"

# Show all pass parameter
echo "$*"
echo "$@"

# Shell script run process ID
echo "$$"

# Backgroud the last process ID
echo "$!"

# Show shell option
echo "$-"

# Show the last command which reture the value
echo "$?"
