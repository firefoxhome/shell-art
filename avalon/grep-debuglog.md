# Grep CGMiner Debuglog

	cat debuglog.log | grep DNA | sed 's/DNA\[//g' | sed 's/\]//g'

	cat debuglog.log | grep TMax | sed 's/TMax\[//g' | sed 's/\]//g'

	cat debuglog.log | grep DH | sed 's/DH\[//g' | sed 's/\%\]//g'

	cat debuglog.log | grep "GHSmm\[" | sed 's/GHSmm\[//g' | sed 's/\]//g'

	cat debuglog.log | grep WU | sed 's/WU\[//g' | sed 's/\]//g'
