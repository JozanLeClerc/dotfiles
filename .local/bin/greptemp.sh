#!/usr/local/bin/dash

while true; do
	sysctl dev.cpu | grep temperature
	sleep 3
done
