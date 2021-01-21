#!/bin/bash

for i in {1..9} ; do
	echo -e "\n${i}ans tabell"
	for x in {1..9} ; do

		echo "$i*$x =" $((i*x))

		if [ ${i} -eq ${x} ] ; then
			echo Hej
		fi
	done
done
