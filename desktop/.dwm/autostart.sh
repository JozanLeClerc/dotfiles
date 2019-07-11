#!/bin/bash
cd ~/
compton &
setxkbmap -layout us,fr -option grp:alt_shift_toggle &
st -e htop &
sleep 0.5s
st -e ranger &
sleep 0.5s
st &
mpd &
st -e neomutt &
st -e ncmpcpp &
st -e calcurse &
st -e newsboat &
pavucontrol &

dte(){
	dte="$(date +"%H:%M")"
	echo -e "$dte"
}

tem(){
	tem="$(sensors | grep 'id' | awk '{print $4}' | cut -c 2-)"
	echo -e " $tem"
}

ips(){
	ip="$(ip -h address show | grep '192.168' | awk '{print $2}' | rev | cut -c 4- | rev)"
	echo -e " $ip"
}

dsk(){
	dsk_root="$(df -h | grep '/dev/sda3' | awk '{print $4}')"
	dsk_home="$(df -h | grep '/dev/sdb1' | awk '{print $4}')"
	echo -e " $dsk_root -  $dsk_home"
}

kbl(){
	layout="$(xkblayout-state print %s | rev | cut -c 1- | rev)"
	echo -e " $layout"
}
while true; do
	xsetroot -name " $(kbl) | $(tem) | $(dsk) | $(ips) | $(dte) "
	sleep 1m # Update time 1 minute
done &
