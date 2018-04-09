#!/bin/bash
#
# automatic upgrade MM firmware, if it has the lastest mm version
#

mm821_flag=0
mm841_flag=0

for local in `cgminer-api estats | sed 's/DNA/\nDNA/g' | sed 's/\=Ver/\n\=Ver/g' | grep '\=Ver' | sed 's/\=Ver\[//g' | sed 's/\]//g'`
do
    type=`echo $local | cut -b 1-3`
    if [ $type == '821' ]; then
        avalon_type=avalon821
	if [ $mm821_flag -eq 0 ]; then
		mm821_flag=1
	else
		continue
	fi
    elif [ $type == '841' ]; then
        avalon_type=avalon841
	if [ $mm841_flag -eq 0 ]; then
		mm841_flag=1
	else
		continue
	fi
    fi

    # Download changelog
    wget https://canaan.io/downloads/software/${avalon_type}/mm/latest/changelog
    remote=`cat changelog | grep 'Version' | awk '{ print $2 }'`

    # Compare MM version
    if [ $local == $remote ]; then
        echo "Don't need reflash firmware version."
	rm changelog
        continue
    else
        wget https://canaan.io/downloads/software/${avalon_type}/mm/latest/MM${type}.mcs
        wget https://canaan.io/downloads/software/${avalon_type}/mm/latest/md5sums
    fi

    # MD5sum compare and upgrade mm firmware
    ck_mm=`md5sum MM${type}.mcs`
    ck_md5=`cat md5sums | grep 'mcs'`
    if [ "$ck_mm" == "$ck_md5" ]; then
	mv MM${type}.mcs mm.mcs
	mv mm.mcs /tmp/
	/usr/bin/mmupgrade
	echo "upgrade $type firmware"
    fi

    # Delete download files
    rm changelog md5sums /tmp/mm.mcs
done

# Clear flag
mm821_flag=0
mm841_flag=0
