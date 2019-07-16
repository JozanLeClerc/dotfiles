#!/bin/bash
cd ~/
compton &
feh --bg-fill /home/jozan/Images/wallpaper.jpg &
setxkbmap -layout us,fr -option grp:alt_shift_toggle &
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
st -e pulsemixer &
