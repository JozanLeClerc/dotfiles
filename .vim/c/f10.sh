#!/bin/sh

gcc -Wall -Wextra -Werror $1
if [ $? -ne 0 ]; then
	exit
fi
./a.out
ret=$?
if [ $ret -ne 0 ]; then
	echo "~>"
	echo -n "return $ret"
	if [ $ret -eq 139 ]; then
		echo " - Segmentation fault!"
	elif [ $ret -eq 134 ]; then
		echo " - Abort!"
	elif [ $ret -eq 138 ]; then
		echo " - Bus error!"
	else
		echo
	fi
else
	echo "~>"
fi
echo
echo
echo  ".vimrc 2.4.1-release Tilde Edition by Joe"
rm -f a.out
