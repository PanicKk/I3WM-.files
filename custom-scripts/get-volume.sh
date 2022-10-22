if [[ "`pamixer --get-mute`" == "true" ]]; then
  dunstify "Volume: Muted!" -u low -t 1000
else
  dunstify "Volume: " -u normal -t 1000 -h int:value:"`pamixer --get-volume`" -h string:synchronous:"Volume: " --replace=555
fi
