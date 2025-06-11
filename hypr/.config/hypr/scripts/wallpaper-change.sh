#!/bin/bash

wallpaper_dir=$HOME/.config/hypr/star-citizen/
current_wall=$(hyprctl hyprpaper listloaded)

function main() {
	wallpaper=$(find "$wallpaper_dir" -type f ! -name "$(basename "$current_wall")" | shuf -n1)
	hyprctl hyprpaper reload , "$wallpaper"
	sed -i "s|^ *path = .*| path = $wallpaper|" "$HOME/.config/hypr/hyprlock.conf"
	sleep 600
	main
}
main

