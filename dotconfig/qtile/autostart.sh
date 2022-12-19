#!/bin/sh
setxkbmap fr bepo
sh /home/noa/.screenlayout/def.sh &
feh --randomize --bg-fill /home/noa/Pictures/wallpapers/*
#picom &
#picom --config .config/picom/picom-blur.conf --experimental-backends &
dunst &
flameshot &
