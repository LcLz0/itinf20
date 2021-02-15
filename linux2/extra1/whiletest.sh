#!/bin/bash

fileName=log.txt
fileTest=$(cat $fileName | wc -l )

if [ $fileTest -ge 30 ]; then
  mv ${fileName} ${fileName}.bak
fi

echo "Hej" >> $fileName
sleep 20
