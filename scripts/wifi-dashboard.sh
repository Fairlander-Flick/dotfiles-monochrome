#!/bin/bash

# Get Current Status
WIFI_STATUS=$(nmcli radio wifi | grep -q "enabled" && echo "ENABLED" || echo "DISABLED")
CON_NAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
[ -z "$CON_NAME" ] && CON_NAME="Disconnected"

# Labels
wifi_pwr="📡 WiFi Power: [ $WIFI_STATUS ]"
wifi_con="🌐 Network: [ $CON_NAME ]"
wifi_mgr="🛠️ Connection Manager"

chosen=$(echo -e "$wifi_pwr\n$wifi_con\n$wifi_mgr" | rofi -dmenu -p "Network Control" -theme ~/.config/rofi/powermenu/dashboard.rasi)

case "$chosen" in
    *"Power"*)
        if [ "$WIFI_STATUS" == "ENABLED" ]; then nmcli radio wifi off; else nmcli radio wifi on; fi
        ;;
    *"Network"*) networkmanager_dmenu ;;
    *"Manager"*) networkmanager_dmenu ;;
esac
