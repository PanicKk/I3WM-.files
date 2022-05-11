#!/bin/bash

## CMD and DIR
EWW="$HOME/.local/bin/eww"
DIR="$HOME/.config/eww/dashboard"

${EWW} -c ${DIR} open --toggle dashboard
