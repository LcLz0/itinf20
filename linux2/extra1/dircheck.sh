#!/bin/bash

dirName=$1

if [ -d $dirName ]; then
  echo "$dirName already exists."
  exit 1

else
  touch ${dirName}/fil{1..10}
fi
