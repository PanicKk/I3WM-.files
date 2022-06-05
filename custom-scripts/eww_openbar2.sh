#!/bin/bash

## CMD and DIR
EWW="$HOME/.local/bin/eww"
DIR="$HOME/.config/eww/bar2"

## Toggle Bar - on/off
i3-msg restart | sleep 0.5 |${EWW} -c ${DIR} open --toggle bar
