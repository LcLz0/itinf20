#!/bin/bash

source logger.sh

file_name=$1

# While to check that file exists, otherwise wait

while [ ! -f $file_name ] ; do
	logger.info "Waiting for data ${RANDOM}"
	sleep 3
done
