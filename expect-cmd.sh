#!/usr/bin/expect
# sudo apt-get install expect
# Login and don't need input passwd

set timeout 30
spawn ssh -l root 192.168.1.233
expect "password:"
send "1\r"
interact
