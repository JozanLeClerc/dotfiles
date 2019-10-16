#!/bin/zsh

make -j 4 run
if [ $? -ne 0 ]; then
	exit
fi
