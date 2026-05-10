#!/bin/bash

# Battery Guard State
STATE_FILE="$HOME/.cache/battery_mode"
[ ! -f "$STATE_FILE" ] && echo "saver" > "$STATE_FILE"

MODE=$(cat "$STATE_FILE")

# Hardware Thresholds (ThinkPad specific)
# Using sudo tee because these files are owned by root
set_thresholds() {
    echo "$1" | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold > /dev/null
}

if [ "$1" == "full" ]; then
    echo "full" > "$STATE_FILE"
    set_thresholds 100
    notify-send "🚀 Pil Modu: Tam Performans" "Şarj %100'e kadar yapılacak ve %20 sınırı kaldırıldı."
elif [ "$1" == "saver" ]; then
    echo "saver" > "$STATE_FILE"
    set_thresholds 80
    notify-send "🔋 Pil Modu: Tasarruf" "Şarj %80'de kesilecek ve %20'de otomatik kapanma aktif."
fi

# Background check logic (called by a systemd timer or loop)
if [ "$1" == "check" ]; then
    if [ "$MODE" == "saver" ]; then
        BAT_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
        BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
        
        if [ "$BAT_LEVEL" -le 20 ] && [ "$BAT_STATUS" == "Discharging" ]; then
            notify-send -u critical "⚠️ KRİTİK PİL" "Pil %20'ye düştü. Sistem 1 dakika içinde kapanacak!"
            sleep 60
            # Double check if still discharging and low
            BAT_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
            BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
            if [ "$BAT_LEVEL" -le 20 ] && [ "$BAT_STATUS" == "Discharging" ]; then
                systemctl poweroff
            fi
        fi
    fi
fi
