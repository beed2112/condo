#!/bin/bash
# add 30 days to today and stuff it in the sensor

date --date='+30 days' +%Y-%m-%d  > /home/homeassistant/.homeassistant/cmds/dash-furnacefilter.sensor
