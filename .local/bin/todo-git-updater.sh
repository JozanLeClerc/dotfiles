#!/bin/dash

date=$(date)

while true; do
	cd /home/jozan/.emacs.d/org/todo || exit 1
	git add . > /dev/null 2>&1
	if git commit -m "$date" > /dev/null 2>&1; then
		git push -u origin master > /dev/null 2>&1
	fi
	sleep 10800
done
