#!/bin/sh


#turn off
/usr/bin/curl -s http://192.168.11.137/gpio/1  | grep -i gpio| sed s'/GPIO is now high<\/html>/1/'  > /home/homeassistant/.homeassistant/cmds/espstatus.txt
echo "1"
