#!/bin/bash

for i in $@; do
	find / -name "$1" -printf "%f\n" | sort | uniq -c
	shift
done
