#!/usr/bin/env bash

rofi_command="rofi -theme ~/.config/rofi/themes/volume.rasi"


## Get Volume
VAR="$(pamixer --get-volume)"
ISMUTED="$(pamixer --get-mute)"


if [[ $ISMUTED == "true" ]]; then
	VOLUME="Volume Muted!"
elif [[ "$(pamixer --get-mute)" == "false" ]]; then 
	VOLUME="$(printf "%.0f\n" "$VAR")%"
fi

# Icons
ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

# Main
chosen="$(echo -e "$options" | $rofi_command -p "$VOLUME" -dmenu $active $urgent -selected-row 0)"
case $chosen in
    $ICON_UP)
        pamixer -i 5 ; ~/.scripts/./get-volume.sh 
        ;;
    $ICON_DOWN)
        pamixer -d 5 ; ~/.scripts/./get-volume.sh 
        ;;
    $ICON_MUTED)
        pamixer -t ; ~/.scripts/./get-volume.sh
esac
