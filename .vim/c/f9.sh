#!/bin/zsh

gcc -Wall -Wextra -Werror $1
if [ $? -ne 0 ]; then
	exit
fi
echo "__"
./a.out ${@:2}
ret=$?
if [ $ret -ne 0 ]; then
	echo "~>"
	echo -n "retrun $ret"
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
echo  "\n\n.vimrc 2.4.1-release Tilde Edition by Joe"
rm -f a.out