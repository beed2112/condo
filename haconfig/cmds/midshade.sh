curl -s http://192.168.11.202/p12/0 > /dev/null
sleep 1
curl -s http://192.168.11.202/p12/1 > /dev/null
#echo "MIDDLE"
echo "0" > /home/homeassistant/.homeassistant/cmds/shade.sensor
