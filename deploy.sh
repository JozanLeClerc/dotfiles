#!/bin/bash

echo "Deploying dotfiles"
cp -rvf .config ~
cp -rvf .scripts ~
cp -vf .Xdefaults ~
cp -vf .Xresources ~
cp -vf .bashrc ~
echo "dotfiles deployed"
