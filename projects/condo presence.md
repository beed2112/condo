
####Condo Presence not so binary

### Why
Utilize the door and motion sensors installed in the residence to determine the Occupancy status. 

Status logic inspired, *pinched*, from Phil H "Making Home Assistant’s Presence Detection not so Binary"(https://philhawthorne.com/making-home-assistants-presence-detection-not-so-binary/)

Prescence detection algorithm "Wasp in a Box" from Rob Collingridge (http://dreamgreenhouse.com/projects/2013/presence/index.php)


### Occupancy status

Following the model Phil used, status values were defined.
  - Just Occupied
  - Occupied
  - Just Unoccupied
  - Unoccupied
  - Unoccupied Extended



### Wasp In a box

A random find one evening on the internet. 

*Snippet from the reference page*

```
The Wasp In A Box Algorithm

Assume there is no wasp in the box.
Have you heard the wasp buzzing in the box?
YES = There is a wasp in the box until you are told otherwise.
Have you opened the box since you last heard buzzing?
YES = There is no wasp in the box.
NO = There is still a wasp in the box if you heard one earlier.
Got to step 2.
```

A slightly different approach.

```
The box was opened
have you heard buzzing in the box 
Yes = there is a wasp in the box
No = there is no wasp in the box
```


The door sensor(s) will be used determine if the box has "been opened"

Motion detecors will be used to detect *buzzing* aka **motion**


***Making it Happen***

Status dropdown definition

*configuration.yaml*

```
  condo_status_dropdown:
    name: Condo
    options:
      - Occupied
      - Just Occupied
      - Just Unoccupied
      - Unoccupied
      - Unoccupied Extended
    initial: Occupied
```


***Determining if there is motion in the residence***

I have been a big fan of ```alert:```  even more so that I have a framework to integrate alert with automations, I was very happy when I was able to utilize it handle some of the *heavy lifting*.

I use ```alert:``` to let me know when my coffee pot is ON.

In this case ``alert:`` is almost being used *backwards* since the lack of motion is OFF.

Since any motion in the condo will be considered it makes sense to put them all in a group and take avdantage of how Home Assistant handles the state of a group.  It also makes it easier to manage as more motion sensors are added/removed.

If any motion sensor in the group detects motion the group will be ON

If no motions sensors in the group have not detected option the group will be OFF

So group = off = no motion = no occupants 

The following is the ```alert:``` configuration 

*There no services to control alert (start, stop, pause, etc) or adjust the values in repeat.*

```    
  emptycondo:
    name: 'emptycondo'
    done_message: 'occupiedcondo'
    entity_id: group.condo_motion_g
    state: 'off'   
    repeat:
      - 5
      -1440
    can_acknowledge: True  # Optional, default is True
    skip_first: True  # we will wait for the second before we send notify 
    notifiers:
      - syslog    
  ```  
  
***Box Opened***

While the ```alert.emptycondo``` is active at all times in this initial implemention the messages are only used when the "box has been opened" the automations that process the messages will be turned on at that time. 

```
- alias: 'turn occpancy monitoring'
  initial_state: on
  trigger:
    platform: state
    entity_id: binary_sensor.entry
    from: 'off'
    to: 'on'
  action:
      - service: automation.turn_on
        entity_id:
        - automation.alert_emptycondo
        - automation.alert_occuppied_condo
 ```
  

Act on the ```emptycondo``` notfication from alert 

```
- alias: 'alert emptycondo'
  initial_state: off
  trigger:
    platform: event
    event_type: call_service
    event_data:
      domain: notify
      service: syslog
  condition:
    condition: template
    value_template: '{{ "emptycondo" in trigger.event.data.service_data["message"]}}'
  action:
      - service: notify.ios_michaels_iphone
        data_template:
          message: >
           The condo is considered empty;
      - service: homeassistant.turn_on
        entity_id: input_boolean.emptycondo

```


