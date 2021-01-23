#!/bin/bash

source logger.sh

file_name=$1

# While to check that file exists, otherwise wait

while [ ! -f $file_name ] ; do
	logger.warning "Waiting for data"
	sleep 3
done

echo "File $file_name exists! Exiting"
