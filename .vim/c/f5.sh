#!/bin/zsh

make -j 4
if [ $? -ne 0 ]; then
	exit
fi
