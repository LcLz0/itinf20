#!/bin/sh

logFile=netLog.txt
timeStamp=$(date "+%Y-%m-%d %H:%M")

for deviceName in $(ls /sys/class/net); do
  deviceStatus=$(cat /sys/class/net/${deviceName}/operstate)
  echo "$timeStamp - $deviceName is $deviceStatus" >> $logFile
done
