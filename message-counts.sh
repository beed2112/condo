#!/bin/sh


# run like this ./message-counts.sh | sort -n -r

#help identify  where the messages are coming from to tune logger: setting

#need to be able to create ha-domains.txt in the directory this is being run

#grep syslog to make a list of homeassistant domains in syslog mesgs
#grep syslog for each record in ha-domains.txt and pipe to wc to get a count

#piping to sort reverse to help determine where to start


 
grep -e '\[homeassistant' /var/log/syslog | awk '{print $10}' | sort -u | sed  's/\[//' |  sed  's/]//' > ha-domains.txt


for item in `cat ha-domains.txt`
do
cnt=`grep $item /var/log/syslog | wc -l`
echo "$cnt - $item "
done
