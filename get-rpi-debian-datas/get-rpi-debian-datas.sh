#!/bin/bash
# Get raspberry debian system datas

for ip in `cat network.conf | awk 'NR > 1'`;
do
    echo "raspberry ip address = $ip"
    ./scp-login.exp $ip
done
