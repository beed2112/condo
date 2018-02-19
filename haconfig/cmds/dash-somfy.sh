#!/bin/bash

stat=`cat /home/homeassistant/.homeassistant/cmds/shade.sensor`
#echo $stat

if [ $stat -eq 1 ]
 then
  /home/homeassistant/.homeassistant/cmds/midshade.sh 
else
 /home/homeassistant/.homeassistant/cmds/upshade.sh

fi

#echo "0" > /home/homeassistant/.homeassistant/cmds/dash-somfy.sensor
