#!/bin/bash

cat cgminer-log-message | sed 's/Temp\[/\nTemp\[/g' | sed 's/Fan/\n/g' | grep "Temp\[" > temp-file

cat temp-file | sed 's/\[/ /g' | sed 's/\]/ /g' > temp-grep

rm temp-file
