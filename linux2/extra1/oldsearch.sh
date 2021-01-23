#!/bin/bash

# Checks directory where script is run for files (not dirs) older than $deltime
# If file is older than $deltime, delete

# Set deltime in epoch time. Default 2 days
deltime=172800

nixtime=$(date +%s)
checktime=$((${nixtime}-${deltime}))

for i in $(ls $pwd); do
	file_ctime=$(/usr/bin/stat -c %W $i)
	if [ $file_ctime -lt $checktime ] && [ -f $i ] ; then

		echo "Found $i. Are you sure you want to delete? y or n"
		read choice_check 
		if [ $choice_check == y ]; then
			echo "Deleting $i"
		else
			echo "Ignoring $i"
		fi
	fi
done
