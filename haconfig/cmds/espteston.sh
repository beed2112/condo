#!/bin/sh


#turn on
/usr/bin/curl -s http://192.168.11.137/gpio/0  | grep -i gpio| sed s'/GPIO is now low<\/html>/0/'  > /home/homeassistant/.homeassistant/cmds/espstatus.txt
echo "0"
