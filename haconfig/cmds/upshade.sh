curl -s http://192.168.11.202/p13/0 > /dev/null
sleep 1
curl -s http://192.168.11.202/p13/1 > /dev/null
#echo "UP"
echo "1" > /home/homeassistant/.homeassistant/cmds/shade.sensor
