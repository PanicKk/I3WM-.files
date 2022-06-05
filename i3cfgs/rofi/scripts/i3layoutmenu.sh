#!/bin/bash

# Get active layout
active_layout="$(i3-msg -t get_tree | jq -r 'recurse(.nodes[];.nodes!=null)|select(.nodes[].focused).layout')"

rofi_command="rofi -xoffset 0 -yoffset 0 -theme themes/i3layoutmenu.rasi"

### Options ###
stacked=""
tabbed=""
split=""
# Variable passed to rofi
options="$stacked\n$tabbed\n$split"

chosen="$(echo -e "$options" | $rofi_command -p "$active_layout" -dmenu -selected-row 1)"
case $chosen in
    $stacked)
        i3-msg layout stacked
        ;;
    $tabbed)
        i3-msg layout tabbed
        ;;
    $split)
        i3-msg layout toggle split
        ;;
esac

