#!/usr/bin/bash

sleep 1

location="$HOME/.config/hypr/resources/lockbg"

rm $location

if [ $1 ]; then
  ln -s $1 $location
else
  ln -s "$(hyprctl hyprpaper listloaded)" $location
fi
