#!/bin/bash

# Hinterlands Premium Powermenu Script

uptime=$(uptime -p | sed -e 's/up //g')

# Premium İkonlar (Nerd Font)
shutdown="󰐥"
reboot="󰜉"
lock="󰌾"
suspend="󰤄"
logout="󰍃"
bat_saver="🔋 Saver"
bat_full="🚀 Full"

# Menü Düzeni
chosen=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown\n$bat_saver\n$bat_full" | rofi -dmenu -p "Uptime: $uptime" -theme ~/.config/rofi/powermenu/base.rasi)

case "$chosen" in
    $shutdown) systemctl poweroff ;;
    $reboot) systemctl reboot ;;
    $lock) hyprlock ;;
    $suspend) systemctl suspend ;;
    $logout) hyprctl dispatch exit ;;
    $bat_saver) bash ~/.scripts/battery-manager.sh saver ;;
    $bat_full) bash ~/.scripts/battery-manager.sh full ;;
esac
