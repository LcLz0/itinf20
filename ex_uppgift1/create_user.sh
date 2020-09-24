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
echo "Hurra wooo"
# Declare variables that will be used through script.
