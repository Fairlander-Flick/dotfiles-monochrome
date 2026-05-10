#!/bin/bash

# Simple Light/Dark Theme Toggler with specific wallpapers
CURRENT_THEME=$(gsettings get org.gnome.desktop.interface color-scheme)
WALLDIR="$HOME/Wallpapers"

if [[ "$CURRENT_THEME" == "'prefer-dark'" || "$CURRENT_THEME" == "'default'" ]]; then
    # Switch to Light Mode
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-Light'
    
    # Set light mode wallpaper
    swww img "$WALLDIR/light-wallpaper.png" -t wipe
else
    # Switch to Dark Mode
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-Dark'
    
    # Set dark mode wallpaper
    swww img "$WALLDIR/dark-wallpaper.png" -t wipe
fi
