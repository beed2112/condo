cd  /home/homeassistant/.homeassistant/automations

# grep out the autodoc tag use sed and tr to get an @ ( not used in any description text) delimitted file 

grep -h '#-autodoc' *.yaml | sed 's/#-autodoc//' | sed 's/yaml/yaml%/' | sed 's/name:/@/' | sed 's/description:/@/' | sed 's/file:/@/' | tr -d '\t\n' | tr 'yaml%' 'yaml\r\n' 
