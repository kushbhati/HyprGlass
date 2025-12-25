#!/bin/bash
# Rofi WiFi Menu

# Set theme
theme="$HOME/.config/rofi/menu.rasi"

# Get status
current=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | cut -d':' -f2)
status=$(nmcli -t -f WIFI g)

if [ "$status" = "enabled" ]; then
    toggle="Disable WiFi"
    icon="󰤨 "
else
    toggle="Enable WiFi"
    icon="󰤭 "
fi

# Options
option_connect="Connect Network"
option_disconnect="Disconnect"

# Main Menu
options="$toggle\n$option_connect\n$option_disconnect"

# Show Menu
selected=$(echo -e "$options" | rofi -dmenu -i -p "WiFi: $current" -theme "$theme")

case $selected in
    "$toggle")
        nmcli radio wifi toggle
        ;;
    "$option_connect")
        # List available networks
        notify-send "Scanning networks..."
        ssid=$(nmcli --colors no -f SSID,BARS dev wifi list | rofi -dmenu -i -p "Select Network" -theme "$theme" | awk '{print $1}')
        if [ -n "$ssid" ]; then
            password=$(rofi -dmenu -password -p "Password for $ssid" -theme "$theme")
            nmcli device wifi connect "$ssid" password "$password"
        fi
        ;;
    "$option_disconnect")
        # Get active WiFi interface dynamically
        wifi_interface=$(nmcli -t -f DEVICE,TYPE device | grep wifi | cut -d: -f1 | head -n1)
        nmcli device disconnect "$wifi_interface"
        ;;
esac
