#!/bin/sh

# this script uses hard-coded paths 
grep -e '^[a-z]' /home/hass/.homeassistant/script/*.yaml | tr : '\n' > /tmp/scriptnames.txt


for item in `cat /tmp/scriptnames.txt`
do
#recursion does not seem to work 
# for now just repeating the the "res=" statement to add directories  

  res=`grep -R script.$item /home/hass/.homeassistant/. --include=*.yaml`
  echo "$item "
  echo "$res  "

done
