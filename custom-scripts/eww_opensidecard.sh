#!/bin/bash

## CMD and DIR
EWW="$HOME/.local/bin/eww"
DIR="$HOME/.config/eww/sidecard"

## Run eww daemon if not running already
${EWW} -c ${DIR} open --toggle dashboard
