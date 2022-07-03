#!/bin/bash

echo ... > $HOME/.updates

updates=$(checkupdates 2>/dev/null | wc -l > $HOME/.updates # this for an arch-based distributions

echo $updates > ~/.updates
