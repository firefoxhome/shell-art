#!/bin/bash

# -C: before or after line numbers, show grep line
cat file | grep -C 3 'test'

# -A: after line numbers, show grep line
cat file | grep -A 3 'test'

# -B: before line numbers, show grep line
cat file | grep -B 3 'test'
