#!/bin/bash

# run path: /etc/rc.d/init.d or /etc/init.d
#./etc/init.d/functions

RETVAL=0
prog="test"

start() {
    echo -n "Start $prog"
    RETVAL=$?
    echo
    return $RETVAL
}

stop() {
    echo -n "Stop $prog"
    RETVAL=$?
    echo
    return $RETVAL
}

restart() {
    echo "Restart $prog"
    stop
    start
}

case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
restart)
    restart
    ;;
*)
    echo "Error parameter"
    exit 1
esac
