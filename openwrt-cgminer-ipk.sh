#!/bin/bash

cp /etc/config/cgminer /etc/config/cgminer.bak
/etc/init.d/cgminer stop

opkg remove cgminer
opkg install http://build.canaan-creative.com:8080/~buildbot/avalon7/openwrt/20180119/rpi3-modelb/packages/cgminer/cgminer_git-8fff4566_brcm2708.ipk

cp /etc/config/cgminer.bak /etc/config/cgminer
/etc/init.d/cgminer stop
sleep 2
/etc/init.d/cgminer start

rm -r /tmp/luci*
