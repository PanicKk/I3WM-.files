#!/bin/sh

get_volume(){
  if [[ "`pamixer --get-mute`" == "true" ]]; then
    dunstify "Volume: Muted!" -u low -t 1000
  else
    dunstify "Volume: `pamixer --get-volume`%" -u normal -t 1000 -h int:value:"`pamixer --get-volume`" -h string:synchronous:"Volume: " --replace=555
  fi
}

get_mic(){
  if [[ "`pamixer --default-source --get-mute`" == "true" ]]; then
    dunstify "Mic: Muted!" -u low -t 1000
  else
    dunstify "Mic Volume: `pamixer --default-source --get-volume`%" -u normal -t 1000 -h int:value:"`pamixer --default-source --get-volume`" -h string:synchronous:"Mic Volume: " --replace=555
  fi
}

if [ "$1" == "volume" ]; then
  get_volume
elif [ "$1" == "mic" ]; then
  get_mic
fi
