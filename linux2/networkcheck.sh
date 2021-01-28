#!/bin/bash

interface=eno1
date=$(date +%Y:%m:%d_%H:%M:%S)
logfile=/home/lz0/networkcheck.log

	if [ ! $(cat /sys/class/net/${interface}/operstate) == "up" ] ; then
		echo "[WARNING] -  $date - $interface is down!" >> $logfile
	fi
