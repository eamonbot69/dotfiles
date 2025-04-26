#!/bin/bash

temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

if [ "$temp" -lt 50 ]; then
  class="cool"      # Blue
elif [ "$temp" -lt 70 ]; then
  class="warm"      # Yellow
else
  class="hot"       # Red
fi

echo "{\"text\": \"${util}%\", \"tooltip\": \"GPU Temp: ${temp}°C\nGPU Util: ${util}%\", \"class\": \"$class\"}"
