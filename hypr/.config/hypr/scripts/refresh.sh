#!/bin/bash

pkill -f $HOME/.config/hypr/scripts/wallpaper-change.sh
sleep 1
nohup $HOME/.config/hypr/scripts/wallpaper-change.sh >/dev/null 2>&1 & disown
notify-send "wallpaper change refreshed."
