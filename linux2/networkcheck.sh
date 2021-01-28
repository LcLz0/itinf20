#!/bin/bash

interface=eno1
date=$(date +%Y:%m:%d_%H:%M:%S)

while true; do
	if [ ! $(cat /sys/class/net/${interface}/operstate) == "up" ] ; then
		echo "[WARNING] $date $interface is down!"
	fi
done
