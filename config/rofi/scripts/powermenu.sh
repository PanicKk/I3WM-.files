#!/usr/bin/env bash

theme="powermenu"
dir="$HOME/.config/rofi/themes/"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -xoffset 0 -yoffset 0 -theme $dir/$theme"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
			systemctl poweroff
        ;;
    $reboot)
			systemctl reboot
        ;;
    $lock)
			sh ~/custom-scripts/i3lock.sh
        ;;
    $suspend)
			mpc -q pause
			amixer set Master mute
			systemctl suspend
        ;;
    $logout)
			i3-msg exit
        ;;
esac
