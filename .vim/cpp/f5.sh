#!/bin/zsh

make -j4
if [ $? -ne 0 ]; then
	exit
fi
