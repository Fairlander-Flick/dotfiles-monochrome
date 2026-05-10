#!/bin/bash

# Get Current Status
BT_STATUS=$(bluetoothctl show | grep -q "Powered: yes" && echo "ON" || echo "OFF")
DEV_NAME=$(bluetoothctl info | grep "Name:" | cut -d' ' -f2-)
[ -z "$DEV_NAME" ] && DEV_NAME="None"

# Labels
bt_pwr=" Bluetooth: [ $BT_STATUS ]"
bt_dev="🎧 Connected: [ $DEV_NAME ]"
bt_mgr="󰂰 Device Manager"

chosen=$(echo -e "$bt_pwr\n$bt_dev\n$bt_mgr" | rofi -dmenu -p "Bluetooth Control" -theme ~/.config/rofi/powermenu/dashboard.rasi)

case "$chosen" in
    *"Bluetooth"*)
        if [ "$BT_STATUS" == "ON" ]; then bluetoothctl power off; else bluetoothctl power on; fi
        ;;
    *"Manager"*) rofi-bluetooth ;;
esac
