#!/bin/bash

cat cgminer-log-message | sed 's/WU/\nWU/g' | sed 's/Freq/\n/g' | grep "WU" > wu-file

cat wu-file | sed 's/\[/ /g' | sed 's/\]/ /g' > wu-grep

rm wu-file
