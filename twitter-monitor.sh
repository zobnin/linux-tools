#!/bin/bash
###############################
# run tasks for the report #
###############################
HOST=`hostname -s`
UP=`uptime | cut -d" " -f4,5 | cut -d"," -f1`
LOAD=`uptime | cut -d":" -f5,6`
PING=`ping -q -c 3 google.com | tail -n1 | cut -d"/" -f5 | cut -d"." -f1`
MEM=`ps aux | awk '{ sum += $4 }; END { print sum }'`
CPU=`ps aux | awk '{ sum += $3 }; END { print sum }'`
###############################
# build the report for post #
###############################
tweet="(HOST) ${HOST} (UP) ${UP} (CPU) ${CPU}% (MEM) ${MEM}% (LOAD) ${LOAD} (PING) ${PING}ms"
#
################################
# check that post is <140 char #
################################
if [ $(echo "${tweet}" | wc -c) -gt 140 ]; then
echo "FATAL: The tweet is longer than 140 characters!"
exit 1
fi
#
################################
# post the report to twitter #
################################
echo $tweet
echo $tweet | ttytter -script

