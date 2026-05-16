#!/bin/bash

# Theme Toggle Script (3 Stages: Light, Gray, Dark)
STATE_FILE="$HOME/.cache/theme_state"
WALL_WHITE="$HOME/Wallpapers/white.jpg"
WALL_BLACK="$HOME/Wallpapers/black.jpg"
WALL_BLACK1="$HOME/Wallpapers/black1.jpg"

WAYBAR_CONFIG="$HOME/.config/waybar"

# Create state file if it doesn't exist (0: light, 1: gray, 2: dark)
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

case $STATE in
    0)
        # Switch to GRAY (State 1)
        awww img "$WALL_BLACK" --transition-type fade --transition-duration 1
        ln -sf "$WAYBAR_CONFIG/style-gray.css" "$WAYBAR_CONFIG/style.css"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        echo "1" > "$STATE_FILE"
        ;;
    1)
        # Switch to DARK (State 2)
        awww img "$WALL_BLACK1" --transition-type fade --transition-duration 1
        ln -sf "$WAYBAR_CONFIG/style-dark.css" "$WAYBAR_CONFIG/style.css"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        echo "2" > "$STATE_FILE"
        ;;
    *)
        # Switch to LIGHT (State 0)
        awww img "$WALL_WHITE" --transition-type fade --transition-duration 1
        ln -sf "$WAYBAR_CONFIG/style-light.css" "$WAYBAR_CONFIG/style.css"
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
        echo "0" > "$STATE_FILE"
        ;;
esac

# Reload Waybar
pkill -USR2 waybar
