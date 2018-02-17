#!/bin/bash
# debug luci-app-*, e.g luci-app-avalon

opkg remove luci-app-avalon

opkg install http://build.canaan-creative.com:8080/~xzx/luci/luci-app-avalon_git-17.269.13244-a16eab0-1_all.ipk

sleep 3

rm -r /tmp/luci*
