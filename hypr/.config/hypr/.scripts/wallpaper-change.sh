#!/bin/bash

wallpaper_dir="$HOME/Pictures/Backgrounds/"
current_wall=$(hyprctl hyprpaper listloaded)

function main() {
	wallpaper=$(find "$wallpaper_dir" -type f ! -name "$(basename "$current_wall")" | shuf -n1)
	hyprctl hyprpaper reload , "$wallpaper"
	sleep 600
	main
}
main

