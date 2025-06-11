#!/bin/bash

temp=$(sensors | grep -m 1 'Package id 0:' | awk '{gsub("[+°C]", "", $4); print int($4)}')
util=$(top -bn1 | awk '/Cpu/ {printf("%d\n", 100-$8)}')

if [ "$temp" -lt 50 ]; then
	class="cool"
elif [ "$temp" -lt 70 ]; then
	class="warm"
else	
	class="hot"
fi

echo "{\"text\": \"${util}%\", \"tooltip\": \"CPU Temp: ${temp}°C\nCPU Util: ${util}%\", \"class\": \"$class\"}"
