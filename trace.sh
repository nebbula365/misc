#!/bin/bash

for ttl in {1..30}
do
	test=$(ping -c 1 $1 -t $ttl | grep From | awk ' {print $3} ')
	if [ -n $test ]; then
		echo Hop:$ttl && echo $test 
	fi
	if [ -z $test ]; then
		final=$(ping -c 1 $1 | grep '64 bytes from' | awk ' {print $5} ')
		echo $final 
		break
	fi
done
