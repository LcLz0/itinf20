#!/bin/bash

name_file=${1}
file_len=$(wc -l ${name_file} | cut -d ' ' -f 1)

#echo $file_len

for (( i=1; i<=$file_len; i++ )) ; do
	awk -v ite=$i 'NR==ite' $name_file
done
