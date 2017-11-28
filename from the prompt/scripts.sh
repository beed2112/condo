#!/bin/sh

# this script uses hardcoded pathes 
grep -e '^[a-z]' /home/homeassistant/.homeassistant/scripts.yaml | sed  's/\://' > /tmp/scriptnames.txt


for item in `cat /tmp/scriptnames.txt`
do
#recursion does not seem to work 
# for now just repeating the the "res=" statement to add directoryies  

  res=`grep -R script.$item /home/homeassistant/.homeassistant/*.yaml`
  res2=`grep -R script.$item /home/homeassistant/.homeassistant/automations/*.yaml`
  echo "$item "
  echo "$res  "
  echo "$res2  "
done
