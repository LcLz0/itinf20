#!/bin/bash

# The point of the script is to, in order:
# Star indicates feature is present in script and working 
#
# * Get user name
# * Create a user with that name
# * Add the user to group itinf
# * Set password for user
# * Log all relevant events in /var/log/create_user.log
# * Log all errors to separate error log
# * Return with a message for user if executed without any errors
# * Return with error code if any errors are encountered

# Variable for log location
log_loc=/var/log/create_user.log
err_loc=/var/log/create_user_error.log

echo "Please enter desired user name"
read user_name

useradd -m -G itinf -s /bin/bash ${user_name} 2> /dev/null
if [ "$?" -ne "0" ] ; then
	echo "Something broke in useradd. Aborting"
	echo "$(date +%Y-%m-%d' '%H:%M) Useradd broke" >> ${err_loc}
	exit 1
fi
echo "$(date +%Y-%m-%d' '%H:%M) : Created user called ${user_name}" >> ${log_loc}

passwd ${user_name}
if [ "$?" -ne "0" ] ; then
	echo "Something broke in passwd. Aborting"
	echo "$(date +%Y-%m-%d' '%H:%M) Passwd broke" >> ${err_loc}
	userdel -r ${user_name}
	exit 2
fi
echo "$(date +%Y-%m-%d' '%H:%M) : Changed password for ${user_name}" >> ${log_loc}

echo "All operations completed succesfully"
exit 0
