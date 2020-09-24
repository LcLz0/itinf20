#!/bin/bash

# Declare some variables 
# Need file passed as arg. Add control for that later on
name_file=${1}
#file_len=$(wc -l ${name_file})

#echo $file_len

for i in $(wc -l ${name_file} | cut -d ' ' -f 1) ; do
	echo "Welcome $i times"
done
