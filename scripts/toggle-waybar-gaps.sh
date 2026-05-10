#!/bin/bash

# Script to toggle Waybar and adjust Hyprland gaps dynamically
STATE_FILE="$HOME/.cache/waybar_gap_state"

# Initialize state if not exists (assume waybar is visible at start)
if [ ! -f "$STATE_FILE" ]; then
    echo "visible" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" == "visible" ]; then
    # Hide Waybar and reset top gap to 10
    pkill -USR1 waybar
    hyprctl keyword general:gaps_out 10
    echo "hidden" > "$STATE_FILE"
else
    # Show Waybar and set top gap to 0
    pkill -USR1 waybar
    hyprctl keyword general:gaps_out 0,10,10,10
    echo "visible" > "$STATE_FILE"
fi
