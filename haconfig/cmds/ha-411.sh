ps -u homeassistant -o %mem= > /home/homeassistant/.homeassistant/cmds/ha-mem.sensor
ps -u homeassistant -o %cpu= > /home/homeassistant/.homeassistant/cmds/ha-cpu.sensor
ps -u homeassistant -o vsz= > /home/homeassistant/.homeassistant/cmds/ha-vsz.sensor
