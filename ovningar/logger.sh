#!/bin/bash

# Define logfile
log_file=logger.log

# Define logger function
logger(){
	timestamp=$(date +%Y-%m-%d\ %H:%M:%S)
	script=$0
	#severity=INFO
	echo "${timestamp} ${script} ${@} "
}

logger.info(){
	logger [INFO] : $*
}

logger.warning(){
	logger [WARNING] : $*
}

logger.error(){
	logger [ERROR] : $*
}
