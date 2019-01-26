#!/bin/bash

if [[ $1 == "clean" ]]; then
	rm dump.log
else
	for (( i=1; i<=2000000; i++ )) # This produces 32bit x 'i' samples
	do
		cat /proc/zynq-puf <(echo) >> dump.log
	done
fi
