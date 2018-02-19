#!/bin/bash


stat=`cat /home/homeassistant/.homeassistant/cmds/dash-melodie.sensor`
#echo $stat

if [ $stat -eq 1 ]
 then
 echo "0" > /home/homeassistant/.homeassistant/cmds/dash-melodie.sensor 
else
 echo "1" > /home/homeassistant/.homeassistant/cmds/dash-melodie.sensor 

fi
