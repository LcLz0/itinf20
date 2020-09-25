#!/bin/bash

# Define logfile
log_file=logger.log

# Define logger function
logger(){
	timestamp=$(date +%Y-%m-%d\ %H:%M:%S)
	script=$0
	#severity=INFO
	echo "${timestamp} ${script} ${@} "
        1>> $log_file	
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

logger.info "Starting script"
logger.warning "Heavy calculation"
sleep 3
logger.error "Calculation complete"
