#!/bin/bash

## CMD and DIR
EWW="$HOME/.local/bin/eww"
DIR="$HOME/.config/eww/bar"

## Toggle Bar - on/off
i3-msg restart | ${EWW} -c ${DIR} open --toggle bar
