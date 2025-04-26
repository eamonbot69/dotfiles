#!/bin/bash

# Get the current layout
CURRENT_LAYOUT=$(hyprctl getoption general:layout | grep 'str:' | awk '{print $2}')

# Determine the new layout
if [[ "$CURRENT_LAYOUT" == "dwindle" ]]; then
    NEW_LAYOUT="master"
else
    NEW_LAYOUT="dwindle"
fi

# Apply the new layout
hyprctl keyword general:layout "$NEW_LAYOUT"

# Notify user (optional)
notify-send "Layout Switched: $NEW_LAYOUT"

