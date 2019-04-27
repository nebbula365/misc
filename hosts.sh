#!/bin/bash

#step_1 - pulls the production CNAME
step_1=$(dig $1 | grep CNAME | awk ' {print $5} ' | head -n 1 | sed 's/\<edgekey\>/&-staging/')

#stores staging IP 
staging_ip=$(dig $step_1 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" -m 1)

#appending results to /etc/hosts
echo $staging_ip $1 >> /etc/hosts 

dig $step_1

echo 'Grepping Host File for appended results'
cat /etc/hosts | grep $1
