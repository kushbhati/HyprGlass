#!/bin/bash
# Rofi Bluetooth Menu - Fast Loading

theme="$HOME/.config/rofi/menu.rasi"

# Show menu IMMEDIATELY with static options
options="Toggle Bluetooth\nScan Devices\nConnect Device\nDisconnect Device"

selected=$(echo -e "$options" | rofi -dmenu -i -p "󰂯 Bluetooth" -theme "$theme")

case $selected in
    "Toggle Bluetooth")
        # Check current state only when toggling
        status=$(bluetoothctl show | grep -c "Powered: yes")
        if [ "$status" -eq 1 ]; then
            bluetoothctl power off
        else
            bluetoothctl power on
        fi
        ;;
    "Scan Devices")
        kitty --class floating -e bluetoothctl scan on &
        ;;
    "Connect Device")
        device=$(bluetoothctl devices | rofi -dmenu -i -p "Select Device" -theme "$theme")
        mac=$(echo "$device" | cut -d' ' -f2)
        if [ -n "$mac" ]; then
            bluetoothctl connect "$mac"
        fi
        ;;
    "Disconnect Device")
        device=$(bluetoothctl devices | rofi -dmenu -i -p "Disconnect Device" -theme "$theme")
        mac=$(echo "$device" | cut -d' ' -f2)
        if [ -n "$mac" ]; then
            bluetoothctl disconnect "$mac"
        fi
        ;;
esac
