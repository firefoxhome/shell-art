#!/bin/bash

cat cgminer-log-message | sed 's/CRC/\nCRC/g' | sed 's/PAIRS/\n/g' | grep "CRC" > crc-file

cat crc-file | sed 's/\[/ /g' | sed 's/\]/ /g' > crc-grep

rm crc-file
