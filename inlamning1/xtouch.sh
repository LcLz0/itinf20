#!/bin/bash
# Jag vet att case egentligen är onödigt här, hade gått lika enkelt med en if bara för att kolla efter --help i arg. Men ville
# testa case, och jag gillar hur nice readability det blev från det. Samma med $file_name, hade lika gärna kunnat köra $1 överallt
# men jag gillar att ha beskrivande variabelnamn i koden istället. Och att kolla om filen redan finns är lite utanför scope, men det
# störde mig att man kunde råka skriva över filer med scriptet.

# Variable purely for readiblity
file_name=$1

# Check for correct number of args
if [ $# -ne 1 ] ; then
	echo "Invalid arguments"
	exit 2	

elif [ -f ${file_name}.sh ] ; then
	echo "Warning! File already exists. Aborting"
	exit 1

fi

# Case, checking for arg --help, otherwise executing file creation
	
case $file_name in
	--help)
		echo -e "Usage: ./xtouch <script-name> [--help]\n"
		echo -e "Positional arguments: \n  script-name 		The name of the script\n"
		echo -e "Optional arguments\n  --help 	Prints this help text"
		exit 0
	;;

	*)
		# Script will create a file, name of arg+.sh, adding a shebang to the top
		echo "#!/bin/bash" >> ${file_name}.sh
		chmod 754 ${file_name}.sh
		exit 0
	;;
esac	
