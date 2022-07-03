#!/bin/bash

# plank support
bspc rule -a Plank layer=above manage=on border=off

# make applications floating
bspc rule --add network state=floating # nmtui spawned by eww bar
bspc rule --add Zathura state=tiled
bspc rule --add discord desktop=^6
