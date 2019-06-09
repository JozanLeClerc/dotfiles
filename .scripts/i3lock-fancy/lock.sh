#!/bin/bash

# Dependencies:
# ffmpeg
# i3lock-color-git

IMAGE=/tmp/i3lock.png
TEXT=""
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
LOCK=$SCRIPTPATH/lock.png
RES=$(xrandr --current | grep '*' | uniq | awk '{print $1}')
#This is a bit cheaty
BOXSIZE=$(expr $(echo $RES | cut -d 'x' -f1) / 2)

if [[ $1 != "" ]]; then
    TEXT=$1
fi

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5,drawtext=fontfile=$SCRIPTPATH/Digital_tech.otf:text=$TEXT:fontcolor='#ffffffe0':fontsize=40:x=(w-tw)/2:y=(h/PHI)+th:shadowcolor='#1d1f21d0':shadowx=2:shadowy=2:box=1:boxcolor=#1a1b22@0.4:boxborderw=$BOXSIZE,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $IMAGE

i3lock --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c  -i $IMAGE

rm $IMAGE
