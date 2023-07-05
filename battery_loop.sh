#!/bin/sh
#In order to send notifications on an interval (e.g., 300 seconds) whenever you start crosh, edit your ~/.bashrc to include code referencing this script.
#For example:
# sh /usr/local/bin/battery_loop.sh &

while true
do  
  battery.sh  
  sleep 300  
done
