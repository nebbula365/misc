#!/bin/bash

for ttl in {1..10}
do
	test=$( ping -c 1 $1 -t $ttl | awk '{print $3}' )
	test1=$(ping -c 1 $1 -t $ttl)
	#if [ '$test' != '64 bytes from' ] ; then
	echo Hop:$ttl && echo $test  #| awk '{print $10}'
	#fi
done
