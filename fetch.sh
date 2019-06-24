#!/bin/bash

echo "Fetching dotfiles"
cp -rvf ~/.config/i3 .config/
cp -rvf ~/.config/i3status .config/
cp -rvf ~/.config/compton .config/
cp -rvf ~/.scripts/ .
cp -vf ~/.Xdefaults .
cp -vf ~/.Xresources .
cp -vf ~/.bashrc .
cp -vf ~/.zshrc .
echo "dotfiles fetched"
