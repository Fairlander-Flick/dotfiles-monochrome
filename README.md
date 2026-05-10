# 🌑 Monochrome Dotfiles

A highly customized, minimalist monochrome setup for Arch Linux using Hyprland. Designed for productivity and a clean aesthetic.

## ✨ Key Features

- **🌓 Dynamic Theme Toggle:** Instant switch between Black and White modes.
- **📊 Unified Dashboards:** Interactive Rofi-based control centers for Audio, WiFi, Bluetooth, and Power.
- **🔋 Intelligent Power Management:** 
  - **Battery Health:** Optional charge capping.
  - **Auto-Shutdown:** Safety measures for low battery.
- **🖥️ Monochrome Greeter:** Modern `greetd` + `tuigreet` login interface.
- **🔒 Stylish Lockscreen:** Optimized `hyprlock` with monochrome visuals.

## 🛠️ Installation

### 1. Prerequisites
This setup assumes you are on Arch Linux. Core requirements:
`hyprland`, `waybar`, `kitty`, `rofi-wayland`, `swww`, `greetd-tuigreet`, `hyprlock`, `fastfetch`.

### 2. Fast Setup
Clone the repository and run the install script:
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles-monochrome.git ~/dotfiles-monochrome
cd ~/dotfiles-monochrome
chmod +x install.sh setup.sh
./install.sh
```

### 3. Manual Configuration
If you prefer manual setup, copy the config folders:
```bash
cp -r btop hypr kitty ranger rofi swaync waybar fastfetch ~/.config/
```

## ⌨️ Keybindings (Default)

| Key | Action |
|-----|--------|
| `SUPER + T` | Open Kitty Terminal |
| `SUPER + S` | Toggle Light/Dark Mode |
| `SUPER + A` | Toggle Waybar |
| `Print`     | Screenshot |

---
*Generated for minimal Arch setups.*
