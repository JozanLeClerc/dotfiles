#!/bin/bash
cd ~/
compton &
setxkbmap -layout us,fr -option grp:alt_shift_toggle
xset r rate 175 60
dunst > /dev/null 2>&1 &
st -e htop &
sleep 0.5s
st -e ranger &
sleep 0.5s
st &
sleep 0.5s
st -e neomutt &
sleep 0.5s
st -e ncmpcpp &
sleep 0.5s
st -e calcurse &
sleep 0.5s
st -e newsboat &
sleep 0.5s
st -e pulsemixer &
sleep 0.5s

dte(){
	dte="$(date +"%H:%M")"
	echo -e "$dte"
}

bat(){
	status="$(acpi -s | awk '{print $3}' | rev | cut -c 2- | rev)"
	percentage="$(acpi -s | awk '{print $4}' | rev | cut -c 2- | rev)"
	if [ echo $status == "" ]; then
		echo -e "Sector"
	else
		echo -e "bat: $status: $percentage"
	fi
}

tem(){
	tem="$(sensors | grep 'id' | awk '{print $4}' | cut -c 2-)"
	echo -e "temp: $tem"
}

ips(){
	ip="$(ip -h address show | grep '192.168' | awk '{print $2}' | rev | cut -c 4- | rev)"
	echo -e "IP: $ip"
}

dsk(){
	dsk_root="$(df -h | grep '/dev/sda7' | awk '{print $4}')"
	dsk_home="$(df -h | grep '/dev/sda8' | awk '{print $4}')"
	echo -e "root: $dsk_root - home: $dsk_home"
}

kbl(){
	layout="$(xkblayout-state print %s | rev | cut -c 1- | rev)"
	echo -e "layout: $layout"
}
while true; do
	xsetroot -name " $(kbl) | $(tem) | $(dsk) | $(ips) | $(bat) | $(dte)"
	sleep 1m # Update time 1 minute
done &
