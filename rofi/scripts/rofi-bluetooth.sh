#!/bin/bash
# Rofi Bluetooth Menu

# Set theme
theme="$HOME/.config/rofi/menu.rasi"

# Get status
status=$(bluetoothctl show | grep "Powered: yes" | wc -l)

if [ $status -eq 1 ]; then
    toggle="Disable Bluetooth"
    state="On"
else
    toggle="Enable Bluetooth"
    state="Off"
fi

# Options
option_scan="Scan Devices"
option_connect="Connect Device"
option_disconnect="Disconnect Device"

# Main Menu
options="$toggle\n$option_scan\n$option_connect\n$option_disconnect"

# Show Menu
selected=$(echo -e "$options" | rofi -dmenu -i -p "Bluetooth: $state" -theme "$theme")

case $selected in
    "$toggle")
        if [ $status -eq 1 ]; then
            bluetoothctl power off
        else
            bluetoothctl power on
        fi
        ;;
    "$option_scan")
        term_cmd="kitty --class floating -e bluetoothctl scan on"
        eval "$term_cmd"
        ;;
    "$option_connect")
        # List devices
        device=$(bluetoothctl devices | rofi -dmenu -i -p "Select Device" -theme "$theme")
        mac=$(echo "$device" | cut -d' ' -f2)
        if [ -n "$mac" ]; then
            bluetoothctl connect "$mac"
        fi
        ;;
    "$option_disconnect")
        device=$(bluetoothctl devices | rofi -dmenu -i -p "Disconnect Device" -theme "$theme")
        mac=$(echo "$device" | cut -d' ' -f2)
        if [ -n "$mac" ]; then
            bluetoothctl disconnect "$mac"
        fi
        ;;
esac
