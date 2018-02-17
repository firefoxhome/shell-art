#!/bin/bash

# get remote repo file
wget https://raw.githubusercontent.com/Canaan-Creative/Avalon-extras/master/scripts/build-avalon-image.sh

# scp remote and local transfer some files
scp xzx@build.canaan-creative.com:/remote-dir/remote-file /local-dir/
scp /local-dir/local-file xzx@build.canaan-creative.com:/remote-dir/
