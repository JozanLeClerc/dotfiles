#!/bin/bash
compton &
st -e htop &
sleep 0.5s
st -e ranger &
sleep 0.5s
st &

dte(){
	dte="$(date +"%H:%M")"
	echo -e "$dte"
}

bat(){
	status="$(acpi -s | awk '{print $3}' | rev | cut -c 2- | rev)"
	percentage="$(acpi -s | awk '{print $4}' | rev | cut -c 2- | rev)"
	echo -e "BAT: $status: $percentage"
}

while true; do
	xsetroot -name "$(bat) | $(dte)"
	sleep 20s # Update time every minute
done &
