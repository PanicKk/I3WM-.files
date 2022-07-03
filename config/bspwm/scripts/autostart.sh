#!/bin/bash

# This is a script to autostart some applications like picom
# or merge some Xresources or change the wallpaper, or in This
# case is necesary to start sxhkd

#  NOTE: This is an example file, you can change it with your stuff

xsetroot -cursor_name left_ptr
picom -b --config ~/.config/picom/picom.conf
xrdb -merge $HOME/.Xresources

# Polybar
# sh ~/.config/polybar/launch.sh

# notification manager
dunst &

# Discord
./usr/share/discord/Discord

# Wallpaper
feh ~/Wallpapers -z --bg-scale

# don't remove this please
pkill bspc
pkill eww

launch_sxhkd () {
  sxhkd &
}

pkill sxhkd ; launch_sxhkd

# Eww Bar
sh ~/custom-scripts/eww_openbar2.sh
