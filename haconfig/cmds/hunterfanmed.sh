curl -s http://patiohunter/p12/0 > /dev/null
sleep 1
curl -s http://patiohunter/p12/1 > /dev/null
#echo "DOWN"
echo "0" > /home/homeassistant/.homeassistant/cmds/hunterfan.sensor
