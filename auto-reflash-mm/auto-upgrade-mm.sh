#!/bin/bash
#
# automatic upgrade MM firmware, if it has the lastest mm version
#

# Download changelog
type=`cgminer-api estats | sed 's/DNA/\n/g' | grep '\=Ver' | sed 's/\[/\n\[/g' | grep '\[' | sed 's/\]//g' | sed 's/\[//g' | cut -b 1-3`
if [ $type == '821' ]; then
    avalon_type=avalon821
elif [$type == '841' ]; then
    avalon_type=avalon841
fi
wget https://canaan.io/downloads/software/${avalon_type}/mm/latest/changelog
remote=`cat changelog | grep 'Version' | awk '{ print $2 }'`

# Compare MM version
for local in `cgminer-api estats | sed 's/DNA/\n/g' | grep '\=Ver' | sed 's/\[/\n\[/g' | grep '\[' | sed 's/\]//g' | sed 's/\[//g'`
do
    echo "$local", "$remote"
    if [ $local == $remote ]; then
        echo "Don't need reflash firmware version."
	rm changelog
        exit
    else
        wget https://canaan.io/downloads/software/${avalon_type}/mm/latest/MM${type}.mcs
        wget https://canaan.io/downloads/software/${avalon_type}/mm/latest/md5sums
    fi
done

# MD5sum compare and upgrade mm firmware
ck_mm=`md5sum MM${type}.mcs`
ck_md5=`cat md5sums | grep 'mcs'`
if [ "$ck_mm" != "$ck_md5" ]; then
    mv MM${type}.mcs mm.mcs
    mv mm.mcs /tmp/
    /usr/bin/mmupgrade
fi

rm changelog md5sums /tmp/mm.mcs
