# 🌑 Monochrome Dotfiles (ThinkPad X1 Yoga Edition)

A highly customized, minimalist monochrome setup for Arch Linux using Hyprland and Waybar. Designed specifically for the ThinkPad X1 Yoga, focusing on productivity, power efficiency, and a clean "cix" aesthetic.

## ✨ Key Features

- **🌓 Dynamic Theme Toggle (`SUPER + S`):** Instant switch between Black and White modes (Wallpapers + Waybar + GTK).
- **📊 Unified Dashboards:** Interactive Rofi-based control centers for Audio, WiFi, Bluetooth, and Battery.
- **🔋 Intelligent Battery Management:** 
  - **Saver Mode:** Hard-capped at 80% charge to preserve battery health.
  - **Auto-Shutdown:** Automatic safe shutdown at 20% battery level.
- **🚀 Cix Terminal Startup:** Personalized `fastfetch` dashboard with system stats and minimalist icons.
- **📸 Advanced Screenshot System:**
  - `Druck`: Select area and copy to clipboard.
  - `ALT + Druck`: Select area and save to `~/Screenshots`.
- **📚 Pro PDF Reading:** Zathura configured with monochrome recoloring (`Ctrl + R`).

## 🛠️ Installation

### 1. Prerequisites
Ensure you have the following packages installed:
```bash
sudo pacman -S hyprland waybar kitty rofi-wayland swww tlp grim slurp wl-clipboard zathura zathura-pdf-mupdf fastfetch bluez bluetoothctl network-manager-applet
```

### 2. Clone and Setup
```bash
git clone https://github.com/Fairlander-Flick/dotfiles-monochrome.git ~/dotfiles-monochrome
cd ~/dotfiles-monochrome

# Copy configurations to ~/.config
cp -r hypr waybar fastfetch rofi zathura scripts ~/.config/
# Note: Ensure scripts in ~/.config/scripts are executable
chmod +x ~/.config/scripts/*.sh
```

### 3. User Scripts
Make sure to symlink or copy the specialized scripts to your local scripts folder:
```bash
mkdir -p ~/.scripts
cp scripts/* ~/.scripts/
chmod +x ~/.scripts/*.sh
```

## ⌨️ Keybindings

| Key | Action |
|-----|--------|
| `SUPER + T` | Open Kitty Terminal |
| `SUPER + V` | Open VS Code |
| `SUPER + S` | Toggle Light/Dark Mode |
| `SUPER + A` | Toggle Waybar (Slide Animation) |
| `Druck` | Screenshot (Clipboard) |
| `ALT + Druck` | Screenshot (Save to Folder) |

---
*Maintained by Fairlander.*
