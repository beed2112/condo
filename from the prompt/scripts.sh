#!/bin/sh

# this script uses hard-coded paths 
# This deletes the readme file and begins rebuilding it.. 
rm readme.md
echo "# Original work by @beed2112" >> readme.md
echo "# Modified by @CCOSTAN" >> readme.md
echo "# Repo : https://github.com/CCOSTAN/Home-AssistantConfig" >> readme.md
echo "# Repo : https://github.com/beed2112/condo " >> readme.md

grep -e '^[a-z]' /home/hass/.homeassistant/script/*.yaml | tr : '\n' > /tmp/scriptnames.txt


for item in `cat /tmp/scriptnames.txt`
do
#recursion does not seem to work 
# for now just repeating the the "res=" statement to add directories  

  res=`grep -R script.$item /home/hass/.homeassistant/. --include=*.yaml`
  echo "**-------------------------------------------------------------------------**" >> readme.md
  echo "$item " >> readme.md
  echo "**-------------------------------------------------------------------------**" >> readme.md
  echo "$res  " >> readme.md

done
cat readme.md
