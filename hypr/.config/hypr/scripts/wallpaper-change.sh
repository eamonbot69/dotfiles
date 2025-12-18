#!/bin/bash

wallpaper_dir=$HOME/Pictures/wallpapers/film

function main() {
	current_wall=$(hyprctl hyprpaper listloaded)
	wallpaper=$(find "$wallpaper_dir" -type f ! -name "$(basename "$current_wall")" | shuf -n1)
	hyprctl hyprpaper reload , "$wallpaper"
	sed -i "s|^ *preload = .*| preload = $wallpaper|" "$HOME/.config/hypr/hyprpaper.conf"
	sed -i "s|^ *wallpaper = .*| wallpaper = , $wallpaper|" "$HOME/.config/hypr/hyprpaper.conf"
	sed -i "s|^ *path = .*| path = $wallpaper|" "$HOME/.config/hypr/hyprlock.conf"
	sleep 600 
	main
}
main

