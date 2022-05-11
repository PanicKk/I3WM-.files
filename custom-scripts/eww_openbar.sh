#!/bin/bash

## CMD and DIR
EWW="$HOME/.local/bin/eww"
DIR="$HOME/.config/eww/bar"

## Run eww daemon if not running already
i3-msg restart | ${EWW} -c ${DIR} open --toggle bar
