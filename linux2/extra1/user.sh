#!/bin/bash

# Check for root
if [ ! $(id -u) -eq 0 ]; then
	echo "You need to be root for this to work"
	exit 3
fi

# Inital checks for correct num of args and input file
if [ -f $1 ] || [ -f $2 ] && [ $# -ne 2 ]; then
	echo "Incorrect arguments"
	echo "Specify inputfile and -a to add users or -d to delete users"
	exit 1
fi

# Passwd block
# Create hashed version of passwd, store in passw.
# Change Linux4Ever to variable to make it generalized.
passw=$(perl -e 'print crypt($ARGV[0], "password")' Linux4Ever)  

# Main block, running
if [ -f $1 ] ; then
	infile=$1
	opts=$2
else
	infile=$2
	opts=$1
fi

if [ $opts == "-a" ]; then
	for i in $(cat ${infile}); do
		useradd -p ${passw} ${i}
	done

elif [ $opts == "-d" ]; then
	for i in $(cat ${infile}); do
		userdel -r $i
	done

else 
	echo "Incorrect options"
	echo "Specify inputfile and -a to add users or -d to delete users"
	exit 2
fi


