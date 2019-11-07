#!/usr/bin/env sh

killall polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)

if type "xrandr" > /dev/null; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload mainbar-dwm -c ~/.config/polybar/config &
	done
else
	polybar --reload mainbar-dwm -c ~/.config/polybar/config &
fi
