#!/bin/bash
cd ~/
compton > /dev/null 2>&1 &
feh --bg-fill /home/jozan/Images/wallpaper.jpg &
setxkbmap -layout us,fr -option grp:alt_shift_toggle &
xset r rate 150 100 &
numlockx on > /dev/null 2>&1
dunst > /dev/null 2>&1 &
st -e htop &
sleep 0.5s
st -e ranger &
sleep 0.5s
st &
mpd &
#mopidy &
st -e neomutt &
st -e ncmpcpp &
st -e calcurse &
st -e newsboat &
pavucontrol &
sleep 0.5s
st -e pulsemixer &
