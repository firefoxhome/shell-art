#!/bin/bash

# putty using, it can not need install, after download finishing, direct to use.
# embedded linux and windows system transfer files, plink.exe commond
# download plink.exe
plink.exe root@192.168.1.244 "cat /root/linux-file" > windows-record-file
