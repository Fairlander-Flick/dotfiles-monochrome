#!/bin/bash

# Simple menu for battery management
bat_saver="🔋 Saver"
bat_full="🚀 Full"

chosen=$(echo -e "$bat_saver\n$bat_full" | rofi -dmenu -p "Battery Management" -theme ~/.config/rofi/powermenu/base.rasi)

case "$chosen" in
    $bat_saver) bash ~/.scripts/battery-manager.sh saver ;;
    $bat_full) bash ~/.scripts/battery-manager.sh full ;;
esac
