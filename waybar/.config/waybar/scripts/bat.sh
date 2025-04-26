#!/bin/bash

# Read battery capacities
cap0=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo 0)
cap1=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo 0)

# Read statuses
stat0=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "Unknown")
stat1=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null || echo "Unknown")

# Average battery percentage
if [ "$cap0" -gt 0 ] && [ "$cap1" -gt 0 ]; then
  avg=$(( (cap0 + cap1) / 2 ))
elif [ "$cap0" -gt 0 ]; then
  avg=$cap0
else
  avg=$cap1
fi

# Set Icon:
if [[ $stat0 == "Charging" ]]; then
	icon="󰂄"
	class="high"
elif (( avg <= 25 )); then
	icon="󰂎"
	class="low"
elif (( avg <= 50 )); then
	icon="󱊡"
	class="mid"
elif (( avg <= 75 )); then
	icon="󱊢"
	class="high"
else
	icon="󱊣"
	class="high"
fi

echo "{\"text\": \"$icon ${avg}%\", \"tooltip\": \"BAT0: ${cap0}% ($stat0)\\nBAT1: ${cap1}% ($stat1)\", \"class\": \"$class\"}"

