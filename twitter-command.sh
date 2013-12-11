#!/usr/bin/bash
USER="ezobnin"
while true; do
    CMD=`echo "/dma +1" | ttytter -script | sed 's/\[.*\]\ //'
    if [ $CMD != $OLD_CMD ]; then
	REPL=`$CMD`
	echo "/dm $USER ${REPL:0:140}" | ttytter -script
	CMD = $OLD_COMD
    fi
    sleep 60
done

