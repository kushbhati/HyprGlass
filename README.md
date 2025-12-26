# HyprGlass

Personal Hyprland dotfiles with a clean, modular configuration.

## 📁 Structure

| Folder | Description |
|--------|-------------|
| `hypr/` | Hyprland config (modular files in `conf/`) |
| `kitty/` | Kitty terminal emulator |
| `rofi/` | Rofi launcher + custom scripts |
| `waybar/` | Waybar status bar |

## 🚀 Installation

Link or copy the folders to `~/.config`:

### Symbolic Links (Recommended)

```bash
HYPRGLASS_DIR="$HOME/path/to/HyprGlass"  # <-- Adjust this

# Backup existing configs
mv ~/.config/hypr ~/.config/hypr.bak
mv ~/.config/kitty ~/.config/kitty.bak
mv ~/.config/rofi ~/.config/rofi.bak
mv ~/.config/waybar ~/.config/waybar.bak

# Create symlinks
ln -s "$HYPRGLASS_DIR/hypr" ~/.config/hypr
ln -s "$HYPRGLASS_DIR/kitty" ~/.config/kitty
ln -s "$HYPRGLASS_DIR/rofi" ~/.config/rofi
ln -s "$HYPRGLASS_DIR/waybar" ~/.config/waybar
```

### Copy Instead

```bash
HYPRGLASS_DIR="$HOME/path/to/HyprGlass"  # <-- Adjust this

cp -r "$HYPRGLASS_DIR/hypr" ~/.config/
cp -r "$HYPRGLASS_DIR/kitty" ~/.config/
cp -r "$HYPRGLASS_DIR/rofi" ~/.config/
cp -r "$HYPRGLASS_DIR/waybar" ~/.config/
```

## 📦 Dependencies

### Core

| Package | Description |
|---------|-------------|
| `hyprland` | Wayland compositor |
| `kitty` | Terminal emulator |
| `rofi` | Application launcher |
| `waybar` | Status bar |

### Utilities

| Package | Description |
|---------|-------------|
| `cliphist`, `wl-clipboard` | Clipboard management |
| `brightnessctl` | Brightness control |
| `playerctl` | Media playback control |
| `wireplumber` | Audio control (`wpctl`) |
| `networkmanager` | WiFi menu (`nmcli`) |
| `bluez`, `bluez-utils` | Bluetooth menu (`bluetoothctl`) |

## ⚙️ Hardware Notes

- **GPU Monitoring** (Waybar):
  - AMD: Check card path with `ls /sys/class/drm/`
  - NVIDIA: Requires `nvidia-smi`
  - Remove unused modules in `waybar/config.jsonc`

- **Display Scaling** (`hypr/conf/monitor.conf`):
  - Default: 1.25 (125%)
  - Adjust to 1.0, 1.5, 2.0, etc. as needed