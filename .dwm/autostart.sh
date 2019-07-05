#!/bin/bash
cd ~/
compton &
setxkbmap -layout us,fr -option grp:alt_shift_toggle
st -e htop &
sleep 0.5s
st -e ranger &
sleep 0.5s
st &
st -e neomutt &
st -e calcurse &
st -e newsboat &

dte(){
	dte="$(date +"%H:%M")"
	echo -e "$dte"
}

bat(){
	status="$(acpi -s | awk '{print $3}' | rev | cut -c 2- | rev)"
	percentage="$(acpi -s | awk '{print $4}' | rev | cut -c 2- | rev)"
	if [ $status == " " ]
	then
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

while true; do
	xsetroot -name " $(tem) | $(dsk) | $(ips) | $(bat) | $(dte)"
	sleep 20s # Update time 20s
done &
