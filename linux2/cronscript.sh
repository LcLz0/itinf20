#!/bin/bash

while true; do

	pachstat=$(systemctl is-active apache2.service)
	date=$(date "+%Y:%m:%d %H:%M:%S")

	echo "${date} Apache is $pachstat" >> /home/ubuntu/apachestatus.log
done
