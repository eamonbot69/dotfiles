#!/bin/bash

# Get per-core utilization (average over 1 second)
cpu_util=$(mpstat -P ALL 1 1 | awk '/^[0-9]/ && $3 ~ /[0-9]+/ {printf "Core %s: %.1f%%\n", $3, 100 - $12}')

# Get CPU temperature(s)
temps=$(sensors | awk '/Core [0-9]+:/ {print $1 " " $2 " " $3}')

echo -e "$cpu_util\n\n$temps"

