#!/bin/bash
cd ~/
compton > /dev/null 2>&1 &
feh --bg-fill /home/jozan/Images/wallpaper.jpg &
setxkbmap -layout us,fr -option grp:alt_shift_toggle &
xset r rate 150 80 &
numlockx on > /dev/null 2>&1
dunst > /dev/null 2>&1 &
st -e ranger &
sleep 0.5s
st &
sleep 0.5s
st -e gotop &
mpd &
#mopidy &
st -e neomutt &
st -e ncmpcpp &
st -e calcurse &
st -e newsboat &
pavucontrol &
sleep 0.5s
st -e pulsemixer &

dte(){
	dte="$(date +"%H:%M")"
	echo -e "$dte"
}

tem(){
	tem="$(sensors | grep 'id' | awk '{print $4}' | cut -c 2-)"
	echo -e "temp: $tem"
}

ips(){
	ip="$(ip -h address show | grep ' 192.168' | awk '{print $2}' | rev | cut -c 4- | rev)"
	echo -e "IP: $ip"
}

dsk(){
	dsk_root="$(df -h | grep '/dev/sda3' | awk '{print $4}')"
	dsk_home="$(df -h | grep '/dev/sdb1' | awk '{print $4}')"
	echo -e "root: $dsk_root - home: $dsk_home"
}

kbl(){
	layout="$(xkblayout-state print %s | rev | cut -c 1- | rev)"
	echo -e "layout: $layout"
}
while true; do
	xsetroot -name " $(kbl) | $(tem) | $(dsk) | $(ips) | $(dte)"
	sleep 1m # Update time 1 minute
done &
