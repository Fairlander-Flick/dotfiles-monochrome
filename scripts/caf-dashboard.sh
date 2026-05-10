#!/bin/bash

# Using waybar's idle_inhibitor state is tricky, we'll use a local state for the dashboard
STATE_FILE="$HOME/.cache/caffeinate_state"
[ ! -f "$STATE_FILE" ] && echo "off" > "$STATE_FILE"

CUR_STATE=$(cat "$STATE_FILE")

# Labels
if [ "$CUR_STATE" == "on" ]; then
    caf_label="☕ Caffeinate: [ ON - SYSTEM STAYING AWAKE ]"
else
    caf_label="💤 Caffeinate: [ OFF - AUTO-SLEEP ENABLED ]"
fi

chosen=$(echo -e "$caf_label" | rofi -dmenu -p "Idle Control" -theme ~/.config/rofi/powermenu/dashboard.rasi)

case "$chosen" in
    *"Caffeinate"*)
        if [ "$CUR_STATE" == "on" ]; then
            echo "off" > "$STATE_FILE"
            pkill -f "waybar" && waybar & # Refresh waybar to sync if needed
            notify-send "💤 Auto-Sleep" "System will now sleep normally."
        else
            echo "on" > "$STATE_FILE"
            notify-send "☕ Caffeinated" "System will stay awake."
        fi
        ;;
esac
