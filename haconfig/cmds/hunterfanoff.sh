curl -s http://patiohunter/p12/0 > /dev/null
sleep 1
curl -s http://patiohunter/p12/1 > /dev/null




echo "1" > /home/homeassistant/.homeassistant/cmds/hunterfan.sensor
