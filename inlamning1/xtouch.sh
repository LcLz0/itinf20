#!/bin/bash

# Check for correct number of args
if [ $# -ne 1 ] ; then
	echo "Invalid arguments"
	exit 2	
fi
# Case, checking for arg --help, otherwise executing file creation
	
case $1 in
	--help)
		echo -e "Usage: ./xtouch <script-name> [--help]\n"
		echo -e "Positional arguments: \n  script-name 		The name of the script\n"
		echo -e "Optional arguments\n  --help 	Prints this help text"
		exit 0
	;;

# Script will create a file, name of arg+.sh, adding a shebang to the top
	*)
		echo "#!/bin/bash" > ${1}.sh
		chmod 754 ${1}.sh
		exit 0
	;;
esac	
