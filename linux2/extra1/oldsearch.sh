#!/bin/bash

nixtime=$(date +%s)
checktime=$(($nixtime-172800))

for i in $(ls $pwd); do
	file_ctime=$(/usr/bin/stat -c %W $i)
	if [ $file_ctime -lt $checktime ] && [ -f $i ] ; then
		echo "Deleting $i"
	fi
done
