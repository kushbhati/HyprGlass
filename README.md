<div align="center">
  <h1>✨ HyprGlass</h1>
  <p><b>A clean, modular, and aesthetic configuration for Hyprland.</b><br>
  <i>Glassmorphism • Dynamic Wallpapers • Intuitive Workflow</i></p>
</div>

---

## 📖 Overview

**HyprGlass** is a personal collection of dotfiles designed for [Hyprland](https://hyprland.org/). It features a modular configuration structure, making it easy to maintain and customize. Ideally suited for users who want a "glassy" look with practical workflows.

### ✨ Features
- **📂 Modular Config**: Hyprland settings are split into logical files (`conf/`).
- **🖼️ Random Wallpapers**: Automatically sets a random wallpaper from `~/Pictures/Hyprpaper` on startup.
- **🎨 Consistent Theming**: Unified look across Hyprland, Waybar, Rofi, and Kitty.
- **⌨️ Intuitive Keybinds**: Standardized SUPER-key based shortcuts.

---

## 📁 Repository Structure

| Directory | Description |
|-----------|-------------|
| `hypr/` | Core Hyprland config & scripts |
| `kitty/` | Terminal configuration |
| `rofi/` | App launcher & menus |
| `waybar/` | Status bar initialization |

---

## 🚀 Installation

### 1. Dependencies
Ensure you have the core components installed (Arch Linux names):
```bash
# Core
sudo pacman -S hyprland kitty waybar rofi

# Utilities
sudo pacman -S hyprpaper cliphist wl-clipboard brightnessctl playerctl wireplumber network-manager-applet bluez bluez-utils
```

### 2. Clone & Symlink
Clone the repo and link the configs to your local `~/.config` directory.

> **⚠️ Warning**: Back up your existing configs first!

```bash
# Clone
git clone https://github.com/yourusername/HyprGlass.git ~/Documents/Projects/HyprGlass

# Link (Adjust path if needed)
export HG_DIR="$HOME/Documents/Projects/HyprGlass"

ln -s "$HG_DIR/hypr" ~/.config/hypr
ln -s "$HG_DIR/kitty" ~/.config/kitty
ln -s "$HG_DIR/rofi" ~/.config/rofi
ln -s "$HG_DIR/waybar" ~/.config/waybar
```

---

## 🖼️ Wallpaper Configuration

HyprGlass uses a custom script to pick a **random wallpaper** from your collection every time you log in.

1.  **Create Directory**: `mkdir -p ~/Pictures/Hyprpaper`
2.  **Add Images**: Place your `.jpg`, `.png`, or `.webp` wallpapers in that folder.
3.  **Enjoy**: Restart Hyprland or run `~/.config/hypr/scripts/wall.sh` to test.

---

## ⌨️ Keybindings

**Modifier Key**: `SUPER` (Windows Key)

| Key | Action |
|-----|--------|
| `SUPER` `Q` | Open Terminal (Kitty) |
| `SUPER` `E` | Open File Manager |
| `SUPER` `F` | Open Browser |
| `SUPER` `R` | Run App Launcher |
| `SUPER` (Tap) | Open App Launcher |
| `SUPER` `V` | Clipboard History (Paste) |
| `SUPER` `D` | Toggle Floating Window |
| `SUPER` `M` | Exit Hyprland |
| `SUPER` `S` | Toggle Special Workspace |

**Window Management**:
- `SUPER` + `Arrow Keys`: Move focus
- `SUPER` + `1-0`: Switch workspace
- `SUPER` + `SHIFT` + `1-0`: Move window to workspace
- `SUPER` + `Mouse Left`: Move window
- `SUPER` + `Mouse Right`: Resize window

---

## ⚙️ Hardware Notes

### 🖥️ Display Scaling
Edit `hypr/conf/monitor.conf` to adjust resolution and usage.
```ini
monitor = , preferred, auto, 1.25  # 125% Scaling
```
Change `1.25` to `1` for 100% or `1.5` for 150%.

### 🔋 Laptop Controls
- **Brightness**: `Fn` keys (requires `brightnessctl`)
- **Volume**: `Fn` keys (requires `wireplumber`)
- **Media**: Play/Pause/Next/Prev keys works globally (requires `playerctl`)

---

## 🎛️ Waybar

HyprGlass includes a fully themed Waybar with integrated module groups and hover effects.

### Module Layout

| Position | Modules |
|----------|---------|
| **Left** | Workspaces, GPU (AMD/NVIDIA), Temperature, CPU, Memory, Disk, Privacy |
| **Center** | Clock (Day \| Time \| Date) |
| **Right** | Tray, MPRIS, Idle + PPD, Audio → Battery (edge-aligned) |

### Features

- **Click to toggle**: Most modules support `format-alt` (click to show additional info)
- **Integrated groups**: Clock, Idle+PPD, and Audio→Battery are visually connected
- **Edge-aligned**: Battery extends flush to the screen edge
- **Hover underlines**: Accent-colored underlines appear on hover
- **MPRIS**: Shows player icon, name, and play/pause status (hidden when stopped)

### Waybar Module Interactions

| Module | Left Click | Right Click | Scroll |
|--------|------------|-------------|--------|
| Pulseaudio | Toggle volume % | Rofi audio menu | Volume up/down |
| Backlight | Toggle brightness % | - | Brightness up/down |
| Network | Toggle SSID | Rofi WiFi menu | - |
| Bluetooth | Toggle status | Rofi Bluetooth menu | - |
| Battery | Toggle capacity % | - | - |
| Power Profiles | Toggle profile name | - | - |
| MPRIS | Play/Pause | - | - |