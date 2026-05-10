#!/bin/bash

# Theme Toggle Script
STATE_FILE="$HOME/.cache/theme_state"
WALL_DARK="$HOME/Wallpapers/black.jpg"
WALL_LIGHT="$HOME/Wallpapers/white.jpg"

WAYBAR_CONFIG="$HOME/.config/waybar"

# Create state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    echo "dark" > "$STATE_FILE"
fi

CURRENT_THEME=$(cat "$STATE_FILE")

if [ "$CURRENT_THEME" == "dark" ]; then
    # Switch to LIGHT
    awww img "$WALL_LIGHT" --transition-type fade --transition-duration 1 --filter Nearest
    ln -sf "$WAYBAR_CONFIG/style-light.css" "$WAYBAR_CONFIG/style.css"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    echo "light" > "$STATE_FILE"
else
    # Switch to DARK
    awww img "$WALL_DARK" --transition-type fade --transition-duration 1 --filter Nearest
    ln -sf "$WAYBAR_CONFIG/style-dark.css" "$WAYBAR_CONFIG/style.css"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    echo "dark" > "$STATE_FILE"
fi

# Reload Waybar
pkill -USR2 waybar
