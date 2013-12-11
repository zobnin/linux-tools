#!/bin/sh

mplayer tv:// -frames 3 -vf flip -vo jpeg
DATE=`date +%F-%H-%M`
mv 00000003.jpg ${DATE}.jpg
google picasa post WebCamera ${DATE.jpg} --title ${DATE}
rm -f 0000*.jpg ${DATE}.jpg

