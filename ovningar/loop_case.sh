#!/bin/sh

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
# echo $loop_type $count $loop_text      ## Debug 

case $loop_type in

	while)
		while [ $i -lt $count ] ; do
			echo $loop_text
			i=$((${i}+1))
		done
		exit 0
		;;

	for)
		for i in `seq 1 ${count}`  ; do
			echo $loop_text
		done
		exit 0
		;;
	
	until)
		until [ $i -eq $count ] ; do
			echo $loop_text
			i=$((${i}+1))
		done
		exit 0
		;;
esac
