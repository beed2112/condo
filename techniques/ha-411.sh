


ps -u homeassistant -o %mem= > /home/homeassistant/.homeassistant/cmds/ha-mem.sensor
ps -u homeassistant -o %cpu= > /home/homeassistant/.homeassistant/cmds/ha-cpu.sensor
ps -u homeassistant -o vsz= > /home/homeassistant/.homeassistant/cmds/ha-vsz.sensor




##-- homeassistant process information
  - platform: command_line
    name: ha_stat_percent_cpu
    scan_interval: 300
    unit_of_measurement: percent
    command: "cat /home/homeassistant/.homeassistant/cmds/ha-cpu.sensor"
  - platform: command_line
    name: ha_stat_percent_memory
    scan_interval: 300
    unit_of_measurement: percent
    command: "cat /home/homeassistant/.homeassistant/cmds/ha-mem.sensor"
  - platform: command_line
    name: ha_stat_virtual_mem
    scan_interval: 300
    unit_of_measurement: KB
    command: "cat /home/homeassistant/.homeassistant/cmds/ha-vsz.sensor"
