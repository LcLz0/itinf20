#!/bin/bash

# Check for correct number of args

if [ $(echo $@ | wc -w) -ne "3" ] ; then 
	echo "Incorrect number of args. Aborting"
	exit 1
fi

# Variables, get from args
loop_type=$1
count=$2
loop_text=$3
i=0

if [ $loop_type == "while" ] ; then
	while [ $i -lt $count ] ; do
		echo $loop_text
		i=$((${i}+1))
	done

elif [ $loop_type == "for" ] ; then
	for i in `seq 1 ${count}`  ; do
		echo $loop_text
	done

elif [ $loop_type == "until" ] ; then
	until [ $i -eq $count ] ; do
		echo $loop_text
		i=$((${i}+1))
	done
fi
