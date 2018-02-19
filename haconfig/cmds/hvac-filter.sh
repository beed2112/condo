#!/bin/sh

today=`date +%Y-%m-%d` 
echo $today > /home/homeassistant/.homeassistant/cmds/hvac-filter.sensor

