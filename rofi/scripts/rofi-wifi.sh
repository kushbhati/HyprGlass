#!/bin/bash
# Rofi WiFi Menu - Fast Loading

theme="$HOME/.config/rofi/menu.rasi"

# Show menu IMMEDIATELY with static options
options="Toggle WiFi\nConnect Network\nDisconnect"

selected=$(echo -e "$options" | rofi -dmenu -i -p "󰤨 WiFi" -theme "$theme")

case $selected in
    "Toggle WiFi")
        nmcli radio wifi toggle
        ;;
    "Connect Network")
        notify-send "Scanning networks..."
        ssid=$(nmcli --colors no -f SSID,BARS dev wifi list | tail -n +2 | rofi -dmenu -i -p "Select Network" -theme "$theme" | awk '{print $1}')
        if [ -n "$ssid" ]; then
            # Try connecting without password first (for saved networks)
            if ! nmcli device wifi connect "$ssid" 2>/dev/null; then
                password=$(rofi -dmenu -password -p "Password for $ssid" -theme "$theme")
                nmcli device wifi connect "$ssid" password "$password"
            fi
        fi
        ;;
    "Disconnect")
        wifi_interface=$(nmcli -t -f DEVICE,TYPE device | grep wifi | cut -d: -f1 | head -n1)
        nmcli device disconnect "$wifi_interface"
        ;;
esac
