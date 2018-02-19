curl -s http://patiohunter/p13/0 > /dev/null
sleep 1
curl -s http://patiohunter/p13/1 > /dev/null
#echo "UP"
echo "0" > /home/homeassistant/.homeassistant/cmds/hunterlight.sensor
