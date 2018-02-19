#!/bin/sh

today=`date +%Y-%m-%d.%H:%M:%S` 
cd /home/homeassistant/.homeassistant/

for item in `ls *.yaml`
do
 echo "processing $item"
 sudo cp .good/$item .good/$item.1
 echo "    age .good/item to .good/$item.1"
 sudo cp $item .good
 echo "    copy $item .good/$item"
 sudo cp $item .good/$item.$today
 echo "    copy $item .good/$item.$today"
 echo "+------------------------------+"
 sleep 1
done

#being lazy using cut n paste to do my automations directory

cd /home/homeassistant/.homeassistant/automations/

for item in `ls *.yaml`
do
 echo "processing $item"
 sudo cp .good/$item .good/$item.1
 echo "    age .good/item to .good/$item.1"
 sudo cp $item .good
 echo "    copy $item .good/$item"
 sudo cp $item .good/$item.$today
 echo "    copy $item .good/$item.$today"
 echo "+------------------------------+"
 sleep 1
done
