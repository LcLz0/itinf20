#!/bin/bash

logfile=/home/lz0/chkfile.log
chkfile=/home/lz0/chkfile.txt
initchksum=$(md5sum $chkfile | awk '{print $1}')

while true; do
	date=$(date "+%Y:%m:%d %H:%M:%S")
	newchksum=$(md5sum $chkfile | awk '{print $1}')

	if [ $newchksum != $initchksum ] ; then
		echo "${date}  ${chkfile} was changed!" >> $logfile
		break
	fi
	
	sleep 10
done

if [ $(wc -l $logfile | awk '{print $1}') -ge 10 ] ; then
	mv ${logfile} ${logfile}.bak
fi

