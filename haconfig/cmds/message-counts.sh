#!/bin/sh
# run like this ./message-counts.sh | sort -n -r

 
grep -e '\[homeassistant' /var/log/syslog | awk '{print $10}' | sort -u | sed  's/\[//' |  sed  's/]//' > ha-domains.txt

for item in `cat ha-domains.txt`
do
cnt=`grep $item /var/log/syslog | wc -l`
echo "$cnt - $item "
done
