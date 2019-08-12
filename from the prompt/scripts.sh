#!/bin/sh

# this script uses hard-coded paths 
# This deletes the readme file and begins rebuilding it.. 

echo "# Original work by @beed2112" > /home/hass/.homeassistant/script/readme.md
echo "# Modified by @CCOSTAN" >> /home/hass/.homeassistant/script/readme.md
echo "# Repo : https://github.com/CCOSTAN/Home-AssistantConfig" >> /home/hass/.homeassistant/script/readme.md
echo "# Repo : https://github.com/beed2112/condo " >> /home/hass/.homeassistant/script/readme.md
echo "# This is a map of the script references from my repo. " >> /home/hass/.homeassistant/script/readme.md

grep -e '^[a-z]' /home/hass/.homeassistant/script/*.yaml | tr : '\n' > /tmp/scriptnames.txt


for item in `cat /tmp/scriptnames.txt`
do
#recursion does not seem to work 
# for now just repeating the the "res=" statement to add directories  

  res=`grep -R script.$item /home/hass/.homeassistant/. --include=*.yaml`
  echo "**-------------------------------------------------------------------------**" >> /home/hass/.homeassistant/script/readme.md
  echo "$item " >> /home/hass/.homeassistant/script/readme.md
  echo "**-------------------------------------------------------------------------**" >> /home/hass/.homeassistant/script/readme.md
  echo "$res  " >> /home/hass/.homeassistant/script/readme.md

done
cat /home/hass/.homeassistant/script/readme.md
