#!/bin/bash

# at commond
man at

at now + 1 minutes
at 00:00 2018-02-14 # at commond follow times

atq # check at
atrm number # rm at

# cron
# minutes hours dates months weeks
* * * * * service httpd restart
*/1 * * * * service httpd restart

# crontab
crontab -l # check cron threads
crontab -r # remove cron threads

# /etc/crontab, add cron threads to /etc/crontab
