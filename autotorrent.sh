#!/bin/bash

# Время бездействия, по прошествии которого
# будет запущена закачка (в милисекундах)
IDLE=120000
# Команда на остановку закачки
STOPCMD="transmission-remote -S"
# Команда на запуск закачки
STARTCMD="transmission-remote -s"

# STOPCMD="deluge-console pause \*"
# STARTCMD="deluge-console resume \*"

STOPPED="yes"
while true; do
    if [ `xprintidle` -gt $IDLE ]; then
	if [ $STOPPED = "yes" ]; then
	    $STARTCMD
	    STOPPED="no"
	fi
    else
	if [ $STOPPED = "no" ]; then
	    $STOPCMD
	    STOPPED="yes"
	fi
    fi
    sleep 60
done

