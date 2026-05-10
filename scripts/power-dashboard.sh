#!/bin/bash

# Files & States
STATE_DIR="$HOME/.cache/power_manager"
mkdir -p "$STATE_DIR"

BAT_LIMIT_FILE="$STATE_DIR/bat_limit"
CPU_MODE_FILE="$STATE_DIR/cpu_mode"
GUARD_FILE="$STATE_DIR/guard"

# Defaults
[ ! -f "$BAT_LIMIT_FILE" ] && echo "80" > "$BAT_LIMIT_FILE"
[ ! -f "$CPU_MODE_FILE" ] && echo "powersave" > "$CPU_MODE_FILE"
[ ! -f "$GUARD_FILE" ] && echo "on" > "$GUARD_FILE"

# Get Current States
CUR_LIMIT=$(cat "$BAT_LIMIT_FILE")
CUR_CPU=$(cat "$CPU_MODE_FILE")
CUR_GUARD=$(cat "$GUARD_FILE")

# Format Display Labels (English)
if [ "$CUR_LIMIT" == "80" ]; then 
    bat_label="🔋 Battery Limit: [ 80% - PROTECT ]"
else 
    bat_label="🚀 Battery Limit: [ 100% - FULL ]"
fi

if [ "$CUR_CPU" == "powersave" ]; then 
    cpu_label="🍃 CPU Profile: [ ECO - QUIET ]"
else 
    cpu_label="⚡ CPU Profile: [ PERFORMANCE ]"
fi

if [ "$CUR_GUARD" == "on" ]; then 
    guard_label="✅ Security: [ AUTO-SHUTDOWN @ 20% ]"
else 
    guard_label="⚠️ Security: [ UNRESTRICTED ]"
fi

# Launch Rofi (English prompt)
chosen=$(echo -e "$bat_label\n$cpu_label\n$guard_label" | rofi -dmenu -p "Power Center" -theme ~/.config/rofi/powermenu/dashboard.rasi)

case "$chosen" in
    *"Battery Limit"*)
        if [ "$CUR_LIMIT" == "80" ]; then
            echo "100" > "$BAT_LIMIT_FILE"
            sudo tlp setcharge 96 100 BAT0
            notify-send "🚀 Battery Mode" "Limit removed (100%)"
        else
            echo "80" > "$BAT_LIMIT_FILE"
            sudo tlp setcharge 70 80 BAT0
            notify-send "🔋 Battery Mode" "Limit enabled (80%)"
        fi
        ;;
    *"CPU Profile"*)
        if [ "$CUR_CPU" == "powersave" ]; then
            echo "performance" > "$CPU_MODE_FILE"
            echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
            notify-send "⚡ Performance" "CPU set to high power"
        else
            echo "powersave" > "$CPU_MODE_FILE"
            echo "powersave" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
            notify-send "🍃 Eco Mode" "Power saving enabled"
        fi
        ;;
    *"Security"*)
        if [ "$CUR_GUARD" == "on" ]; then
            echo "off" > "$GUARD_FILE"
            notify-send -u critical "⚠️ Warning" "Auto-shutdown disabled!"
        else
            echo "on" > "$GUARD_FILE"
            notify-send "✅ Secured" "Auto-shutdown active"
        fi
        ;;
esac
