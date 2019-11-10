#!/bin/sh

make -j5
if [ $? -ne 0 ]; then
	exit
fi
