#!/bin/bash

val1=`ifconfig | grep enxb | awk '{print $1 }'`
val2=`cat /etc/network/interfaces | grep 'auto\ enxb' | awk '{print $2 }'`
sudo sed -i "s/${val2}/${val1}/g" /etc/network/interfaces

sudo ifconfig ${val1} down
sleep 1
sudo ifconfig ${val2} up
