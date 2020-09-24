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
# 1 : Add sudo check
#
# 2 : Add error code for useradd
#
# 3 : Generalize passw function, either from input or from already hashed file. Same file?
#
# 4 : Streamline f_name l_name, should only be execution on user_name without extra vars
#
# 5 : Add logging
#
# 6 : Add testing on username, to check for invalid characters in name. Use if-block in for-loop.
#     Use $i to pass information to log about on what line incorrect name is found. 
#
###################################################################################################

# Declare variables that will be used through script.
file_len=$(wc -l $1 | cut -d ' ' -f 1) > /dev/null		 # Gets total len of arg file
file_name=$1							 # Var for $1, readability only
# Log locations
#log_loc=/var/log/usercreation/create.log
#err_loc=/var/log/usercreation/error.log

# Check that arg exists and is a regular file
if [ ! -f $file_name ] ; then
	echo "Incorrect file. Try again"
	exit 2
fi

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
done
