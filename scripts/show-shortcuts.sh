#!/bin/bash

# Define keybindings in a clear format
shortcuts="🚀 APPLICATIONS
SUPER + Return : Kitty Terminal
SUPER + W      : Firefox Browser
SUPER + E      : PCManFM Manager
SUPER + V      : VS Code
SUPER + Y      : YouTube Music
SUPER + D      : App Launcher (Rofi)

⚙️ SYSTEM CONTROLS
SUPER + S      : Toggle Light/Dark Theme
SUPER + A      : Toggle Waybar & Gaps
SUPER + SHIFT + \ : Lock Screen (Hyprlock)
SUPER + SHIFT + D : Power Menu
SUPER + N      : Network Menu
SUPER + Q      : Kill Active Window
SUPER + I      : Show this Help

📸 SCREENSHOTS
Print          : Area to Clipboard
ALT + Print    : Area to ~/Screenshots

🪟 WINDOW MGMT
SUPER + H/J/K/L : Focus (Vim-style)
SUPER + SHIFT + H/J/K/L : Move Window
SUPER + F      : Toggle Fullscreen
SUPER + 1-0    : Switch Workspace"

# Show in Rofi with custom styling
echo -e "$shortcuts" | rofi -dmenu -p "Shortcuts" -theme-str 'window {width: 40%;} listview {lines: 25;}'
