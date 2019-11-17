#!/bin/sh

ext="${1##*.}"
mpvFiles="mkv mp4 gif" 
sxivFiles="png jpg jpeg jpe"
wgetFiles="flac mp3 mp3?source=feed opus pdf doc docx"

cd ~/Downloads || exit

if echo "$sxivFiles" | grep -w "$ext" > /dev/null; then
	nohup sxiv "$1" > /dev/null &
elif echo "$mpvFiles" | grep -w "$ext" > /dev/null; then
	nohup mpv --loop --quiet "$1" > /dev/null &
elif echo "$wgetFiles" | grep -w "$ext" > /dev/null; then
	nohup st -e wget "$1" > /dev/null &
else
	nohup qutebrowser "$1" > /dev/null &
fi
