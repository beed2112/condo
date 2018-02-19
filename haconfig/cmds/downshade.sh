curl -s http://192.168.11.202/p14/0 > /dev/null
sleep 1
curl -s http://192.168.11.202/p14/1 > /dev/null
echo "DOWN"
echo "DOWN" > shade.sensor
