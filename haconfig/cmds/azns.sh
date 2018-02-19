#!/bin/sh

#sale
curl -s https://www.aznaturalselections.com/specials/ | grep -i expires  | sed 's/\&#8211;//g' | sed 's/\&amp;//g' | sed 's/<p>//g' | sed 's/<\/p>//g' | sed 's/  / /g' |sed 's/Excludes Live Resin and Distillate//' | sed 's/While supplies last//I'| sed 's/Excludes Live Resin and Rosin//' |head -n1 > /home/homeassistant/.homeassistant/cmds/aznssale.txt

#strains
curl -s https://www.leafly.com/dispensary-info/arizona-natural-selections-scottsdale/specials | grep -a5 -i 'TODAY\&#39;S STRAINS'| grep 'special-details' | sed 's/<p class="special-details">//' | sed 's/\&amp;//g'| sed 's/\&#39;/\`/g' |  awk -F':' '{print $2}' > /home/homeassistant/.homeassistant/cmds/aznsstrains.txt

echo "1"
