#!/bin/bash
###################################################################################################
# Script will read names from a text file, change them to a more linuxfriendly format, and create
# a user with that name and pw Linux4Ever. Script should be general for any lenght of text file.
# Script will check that passed arg is an actual file, otherwise abort.
###################################################################################################
#					Error codes
# 1 : Lacking root 
# 2 : Incorrect file passed
###################################################################################################
###################################################################################################
#					   Todo 	
# * : Add sudo check
#
# x : Generalize passw function, either from input or from already hashed file. New file 
#
# x : Streamline f_name l_name, should only be execution on user_name without extra vars
#
# x : Add logging
#
# x : Add testing on username, to check for invalid characters in name. Use if-block in for-loop.
#     Use $i to pass information to log about on what line incorrect name is found. 
#
###################################################################################################

# Check for root privs
if [ $(id -u) -ne 0 ] ; then
	echo "This script needs root privs."
	exit 1
fi

# Check that arg exists and is a regular file
if [ ! -f $file_name ] ; then
	echo "Incorrect file. Try again"
	exit 2
fi

# Declare variables that will be used through script.
file_len=$(wc -l $1 | cut -d ' ' -f 1) > /dev/null		 # Gets total len of arg file
file_name=$1							 # Var for $1, readability only
# Log locations
log_loc=/var/log/usercreation/create.log
err_loc=/var/log/usercreation/error.log

# Create hashed version of passwd, store in passw.
# Change Linux4Ever to variable to make it generalized.
passw=$(perl -e 'print crypt($ARGV[0], "password")' Linux4Ever)  

for (( i=1; i<=$file_len; i++ )) ; do
	user_name=$(awk -v ite=$i 'NR==ite' $file_name)		 # Read username
	user_name=$(echo $user_name | awk '{print tolower($0)}') # Change username to lowercase
	f_name=$(echo $user_name | cut -c 1)			 # Cut first char of first name
	l_name=$(echo $user_name | cut -d ' ' -f 2)		 # Cut whole last name
	user_name=$f_name$l_name				 # Add first char to last name
	useradd -p $passw $user_name				 # Run useradd
	
	if [ $? -eq 3 ] ; then
		echo "Incorrect username. Refer to log for more info."
		echo "$(date +%Y-%m-%d' '%H:%M) : Incorrect username on line $i" >> $err_loc
	elif [ $? -ne 0 ] ; then
		echo "Something in useradd broke. Sorry!"
		echo "$(date +%Y-%m-%d' '%H:%M) : Something that is not exit value 3 broke in useradd on line $i" >> $err_loc
	else
		echo "User $user_name created! Woo!"
		echo "$(date +%Y-%m-%d' '%H:%M) : Created $user_name" >> $log_loc
	fi
done
