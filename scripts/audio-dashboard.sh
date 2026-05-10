#!/bin/bash

# Get Current Status
VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}' | cut -d. -f1)
MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED" && echo "MUTED" || echo "ACTIVE")
MIC_MUTE=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED" && echo "MUTED" || echo "ACTIVE")

# Labels
vol_label="🔊 Volume: [ $VOL% - $MUTE ]"
mic_label="🎙️ Microphone: [ $MIC_MUTE ]"
set_label="⚙️ Audio Settings"

chosen=$(echo -e "$vol_label\n$mic_label\n$set_label" | rofi -dmenu -p "Audio Control" -theme ~/.config/rofi/powermenu/dashboard.rasi)

case "$chosen" in
    *"Volume"*) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
    *"Microphone"*) wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
    *"Settings"*) kitty --class="floating_term" -e pulsemixer ;;
esac
