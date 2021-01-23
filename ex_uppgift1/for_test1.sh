#!/bin/bash

# Declare some variables 
# Need file passed as arg. Add control for that later on
name_file=${1}
file_len=$(wc -l ${name_file} | cut -d ' ' -f 1)

#echo $file_len

for i in $file_len ; do
	echo "Welcome $i times"
done
