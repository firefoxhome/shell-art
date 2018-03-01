#!/bin/bash

# install ssh, PC but not raspberry Pi
sudo apt-get install ssh

# raspberry Pi debian system
# start ssh
sudo /etc/init.d/ssh start

# check ssh status, don't have errors, ssh is normal
sudo /etc/init.d/ssh status
