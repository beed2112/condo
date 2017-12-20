
![Random Times](img/random-sensor.png)

```

### Using the random sensor to create random times and duration that would be used to simulate occupancy 

### Sensor definitions
###------------------------------------Random --------------------------------------
#https://home-assistant.io/components/sensor.random/
## generate random times for different parts of the day
## generate random durations to go with the times
## 86400 seconds in 24 hours
##  random_evening_hh          16-23
##  random_afternoon_hh        12-16
##  random_morning_hh          7-11
##  random_early_morning_hh    4-6
##  random_late_nite_hh        0-3

sensor:
  - platform: random
    name: random_late_nite_hh
    minimum: 00
    maximum: 3
    scan_interval: 86399
    
  - platform: random
    name: random_late_nite_mm
    minimum: 0
    maximum: 59
    scan_interval: 86399

  - platform: random
    name: random_late_nite_Duration
    minimum: 5
    maximum: 59
    scan_interval: 86399
 ###----
 
  - platform: random
    name: random_evening_hh
    minimum: 16
    maximum: 23
    scan_interval: 86399
    
  - platform: random
    name: random_evening_mm
    minimum: 0
    maximum: 59
    scan_interval: 86399

  - platform: random
    name: random_evening_Duration
    minimum: 5
    maximum: 59
    scan_interval: 86399
###----
  - platform: random
    name: random_afternoon_hh
    minimum: 12
    maximum: 16
    scan_interval: 86399
    
  - platform: random
    name: random_afternoon_mm
    minimum: 0
    maximum: 59
    scan_interval: 86399

  - platform: random
    name: random_afternoon_Duration
    minimum: 5
    maximum: 59
    scan_interval: 86399
###----

  - platform: random
    name: random_morning_hh
    minimum: 07
    maximum: 11
    scan_interval: 86399

  - platform: random
    name: random_morning_mm
    minimum: 0
    maximum: 59
    scan_interval: 86399

  - platform: random
    name: random_morning_Duration
    minimum: 5
    maximum: 59
    scan_interval: 86399
###----

  - platform: random
    name: random_early_morning_hh
    minimum: 04
    maximum: 06
    scan_interval: 86399

  - platform: random
    name: random_early_morning_mm
    minimum: 00
    maximum: 59
    scan_interval: 86399

  - platform: random
    name: random_early_morning_Duration
    minimum: 5
    maximum: 59
    scan_interval: 86399
    
    
    
    
    ###------------------------------------Random --------------------------------------
  - platform: template
    sensors:
      random_late_nite_time:
        value_template: >
          {% if states.sensor.random_late_nite_hh.state | length == 1 -%}
            0{{states.sensor.random_late_nite_hh.state}}:
          {%- else -%}
            {{states.sensor.random_late_nite_hh.state}}:
          {%- endif %}
          {% if states.sensor.random_late_nite_mm.state | length == 1 -%}
            0{{states.sensor.random_late_nite_mm.state}}
          {%- else -%}
            {{states.sensor.random_late_nite_mm.state}}
          {%- endif %}
      random_evening_time:
        value_template: >
          {% if states.sensor.random_evening_hh.state | length == 1 -%}
            0{{states.sensor.random_evening_hh.state}}:
          {%- else -%}
            {{states.sensor.random_evening_hh.state}}:
          {%- endif %}
          {% if states.sensor.random_evening_mm.state | length == 1 -%}
            0{{states.sensor.random_evening_mm.state}}
          {%- else -%}
            {{states.sensor.random_evening_mm.state}}
          {%- endif %}
      random_afternoon_time:
        value_template: >
          {% if states.sensor.random_afternoon_hh.state | length == 1 -%}
            0{{states.sensor.random_afternoon_hh.state}}:
          {%- else -%}
            {{states.sensor.random_afternoon_hh.state}}:
          {%- endif %}
          {% if states.sensor.random_afternoon_mm.state | length == 1 -%}
            0{{states.sensor.random_afternoon_mm.state}}
          {%- else -%}
            {{states.sensor.random_afternoon_mm.state}}
          {%- endif %}
      random_morning_time:
        value_template: >
          {% if states.sensor.random_morning_hh.state | length == 1 -%}
            0{{states.sensor.random_morning_hh.state}}:
          {%- else -%}
            {{states.sensor.random_morning_hh.state}}:
          {%- endif %}
          {% if states.sensor.random_morning_mm.state | length == 1 -%}
            0{{states.sensor.random_morning_mm.state}}
          {%- else -%}
            {{states.sensor.random_morning_mm.state}}
          {%- endif %}
      random_early_morning_time:
        value_template: >
          {% if states.sensor.random_early_morning_hh.state | length == 1 -%}
            0{{states.sensor.random_early_morning_hh.state}}:
          {%- else -%}
            {{states.sensor.random_early_morning_hh.state}}:
          {%- endif %}
          {% if states.sensor.random_early_morning_mm.state | length == 1 -%}
            0{{states.sensor.random_early_morning_mm.state}}
          {%- else -%}
            {{states.sensor.random_early_morning_mm.state}}
          {%- endif %}
        
  
 ```
 
  
