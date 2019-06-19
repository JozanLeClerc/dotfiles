#!/bin/bash

echo "Fetching dotfiles"
cp -rv ~/.config .
cp -rv ~/.scripts .
cp -v ~/.Xdefaults .
cp -v ~/.Xresources .
cp -v ~/.bashrc .
echo "dotfiles fetched"
