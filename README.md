# 🌑 Monochrome Dotfiles

Minimalist, sleek, and high-performance **Arch Linux** configuration. Optimized for **Hyprland** and designed for those who want a "distraction-free" monochrome aesthetic without sacrificing functionality.

> **Note:** This setup is tailored for high-productivity workflows, featuring custom control centers, dynamic theme toggling, and a modern TUI login experience.

---

## 📸 Overview

- **Window Manager:** [Hyprland](https://hyprland.org/) (Wayland)
- **Bar:** [Waybar](https://github.com/Alexays/Waybar) (Modular & Animated)
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Shell:** Zsh (Oh-My-Zsh)
- **Launcher:** Rofi (Wayland-fork)
- **Login Manager:** `greetd` + `tuigreet` (Monochrome TUI)
- **Lockscreen:** `hyprlock` (Customized)

---

## ✨ Key Features

- **🌓 Dynamic Theme Toggle (`SUPER + S`):** Instant switch between Black and White modes (Wallpapers + UI).
- **📊 Interactive Dashboards:** Custom Rofi-based menus for Power, WiFi, Bluetooth, and Audio.
- **🔋 Battery Management:** Intelligent capping and auto-shutdown features for laptop longevity.
- **🖥️ Login & Lock:** `greetd` + `tuigreet` (TUI) and `hyprlock` (Monochrome).
- **📚 PDF Reader:** `Zathura` with high-quality math rendering and dark mode.
- **📦 Archive Tooling:** Full support for `.zip`, `.7z`, and `.rar` files.
- **📸 Screenshot System:** Built-in area selection with `grim` and `slurp`.

---

## 🛠️ Installation

### 1. The "Auto-Pilot" Way (Recommended)
This repo includes a semi-automated installation script for Arch Linux.

```bash
# Clone the repository
git clone https://github.com/Fairlander-Flick/dotfiles-monochrome.git ~/dotfiles-monochrome
cd ~/dotfiles-monochrome

# Make scripts executable
chmod +x install.sh setup.sh

# Run the installer (It will install packages and copy configs)
./install.sh
```

### 2. Manual Setup
If you want to cherry-pick configurations:
```bash
# Copy config folders to your home
cp -r btop fastfetch hypr kitty ranger rofi swaync waybar zathura ~/.config/
```

---

## ⌨️ Keybindings ($mainMod = SUPER)

### 🚀 Applications
| Key | Action |
|-----|--------|
| `SUPER + Return` | Open Kitty Terminal |
| `SUPER + W` | Open Browser |
| `SUPER + E` | Open File Manager |
| `SUPER + V` | Open VS Code |
| `SUPER + D` | Application Launcher (Rofi) |

### ⚙️ System Controls
| Key | Action |
|-----|--------|
| `SUPER + S` | **Toggle Light/Dark Theme** |
| `SUPER + A` | Toggle Waybar Visibility |
| `SUPER + SHIFT + \` | Lock Screen (Hyprlock) |
| `SUPER + SHIFT + D` | Power Menu / Dashboard |
| `SUPER + N` | Network Menu |
| `SUPER + Q` | Kill Active Window |
| `SUPER + SHIFT + E` | Exit Hyprland |

### 📸 Screenshots
| Key | Action |
|-----|--------|
| `Print` | Capture Area to **Clipboard** |
| `ALT + Print` | Capture Area and **Save to ~/Screenshots** |

### 🪟 Window Management
| Key | Action |
|-----|--------|
| `SUPER + H/J/K/L` | Move Focus (Vim-style) |
| `SUPER + SHIFT + H/J/K/L` | Move Window (Vim-style) |
| `SUPER + F` | Toggle Fullscreen |
| `SUPER + SHIFT + V` | Toggle Floating Mode |
| `SUPER + 1-0` | Switch Workspace 1-10 |

---

## 📁 Repository Structure

```text
.
├── hypr/           # Hyprland & Hyprlock configurations
├── waybar/         # Highly customized status bar
├── rofi/           # Menus, Dashboards, and Power Center
├── scripts/        # Backend logic for system controls
├── fastfetch/      # Minimalist system info dashboard
├── zathura/        # Monochrome PDF reader settings
└── install.sh      # Main installation script
```

---
*Edited files from hyprzark*
