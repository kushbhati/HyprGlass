# HyprGlass Configuration

This repository contains my personal configuration files (dotfiles) for Hyprland and related tools.

## Project Structure

- **hypr/**: Hyprland configuration (main config and modular files).
- **kitty/**: Configuration for the Kitty terminal emulator.
- **rofi/**: Configuration for Rofi (application launcher).
- **waybar/**: Configuration for the Waybar status bar.

## Installation / Sync

To use these configurations, you need to link or copy the folders to your `~/.config` directory.

### Method 1: Symbolic Links (Recommended)

This method keeps your config files in this repository, so any changes you make are instantly reflected here (useful for version control).

```bash
# Set HYPRGLASS_DIR to where you cloned this repo
HYPRGLASS_DIR="$HOME/path/to/HyprGlass"  # <-- Adjust this path

# Backup existing configs if necessary
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

### Method 2: Copying

If you prefer to just copy the files:

```bash
# Set HYPRGLASS_DIR to where you cloned this repo
HYPRGLASS_DIR="$HOME/path/to/HyprGlass"  # <-- Adjust this path

cp -r "$HYPRGLASS_DIR/hypr" ~/.config/
cp -r "$HYPRGLASS_DIR/kitty" ~/.config/
cp -r "$HYPRGLASS_DIR/rofi" ~/.config/
cp -r "$HYPRGLASS_DIR/waybar" ~/.config/
```

## Dependencies

Ensure you have the following programs installed:
- Hyprland
- Kitty
- Rofi
- Waybar
- NetworkManager (`nmcli`) - for WiFi menu
- BlueZ (`bluetoothctl`) - for Bluetooth menu
- PulseAudio/PipeWire (`pamixer`, `pactl`) - for audio menu

### Hardware-Specific Notes

Some features are hardware-specific and may need adjustment:

- **GPU Monitoring** (Waybar): 
  - AMD GPU requires checking your card number: `ls /sys/class/drm/`
  - NVIDIA GPU requires `nvidia-smi` (part of NVIDIA drivers)
  - Remove unused GPU modules from `waybar/config.jsonc` if not applicable

- **Display Scaling** (`hypr/conf/monitor.conf`): 
  - Default is set to 1.25 (125%)
  - Adjust based on your display preferences (1.0, 1.25, 1.5, 2.0, etc.)