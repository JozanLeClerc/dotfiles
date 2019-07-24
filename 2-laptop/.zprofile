#if [[ ! $DISPLAY && $XDG_VTNR -eq 2 ]]; then
if [[ $XDG_VTNR -eq 2 ]]; then
	  exec startx
fi
