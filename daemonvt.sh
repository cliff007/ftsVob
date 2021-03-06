#!/bin/bash
SCRIPTNAME=daemonvt.sh
PIDFILE=fts.pid
PYTHONCMD=/usr/bin/python
do_start() {
    $PYTHONCMD ftsMain.py
}
do_stop() {
    kill `cat $PIDFILE` || echo -n "fts not running"
}
case "$1" in
    start)
        do_start
    ;;
    stop)
        do_stop
    ;;
    restart)
        do_stop
        do_start
    ;;
    *)
    echo "Usage: $SCRIPTNAME {start|stop||restart}" >&2
    exit 3
    ;;
esac
exit
