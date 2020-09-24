#!/bin/bash

###################################################################################################
# Script will read names from a text file, change them to a more linuxfriendly format, and create
# a user with that name and pw Linux4Ever. Script should be general for any lenght of text file.
# Script will check that passed arg is an actual file, otherwise abort.
###################################################################################################
#					Error codes
# 1 : Incorrect file passed  
###################################################################################################

# Check that arg exists and is a regular file
if [ ! -f $1 ] ; then
	echo "Incorrect file. Try again"
	exit 1
fi

# Declare variables that will be used through script.
file_len=$(wc -l $1 | cut -d ' ' -f 1)
file_list=$1

for (( i=1; i<$file_len; i++ )) ; do
	awk -v ite=$i 'NR==ite' $file_list
done
