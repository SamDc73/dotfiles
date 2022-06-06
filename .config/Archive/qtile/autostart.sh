#!/bin/sh

polybar -c ~/.config/polybar/config_qtile.ini
sh ~/.config/dunst/dunstrc
feh --randomize --bg-scale --auto-zoom --image-bg 1920x1080 /home/samdc/Pictures/Desktop_wallpaper/*
picom -b --experimental-backends

