#!/bin/bash
# Get raspberry debian system datas

for IP in `cat network.conf | awk 'NR > 1'`;
do
    ssh-keygen -f "/home/xzx/.ssh/known_hosts" -R $IP
    echo "raspberry ip address = $IP"
    ./scp-login.exp $IP
done
