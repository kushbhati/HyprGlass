#!/bin/bash
# Rofi Audio Menu

# Set theme
theme="$HOME/.config/rofi/menu.rasi"

# Get current volume and source
vol=$(pamixer --get-volume)
is_muted=$(pamixer --get-mute)

if [ "$is_muted" = "true" ]; then
    toggle="Unmute"
    icon="󰝟 "
else
    toggle="Mute"
    icon="󰕾 "
fi

# Options
option_sink="Output Device"
option_source="Input Device"
option_gui="Advanced Controls (GUI)"

# Main Menu
options="$toggle\n$option_sink\n$option_source\n$option_gui"

# Show Menu
selected=$(echo -e "$options" | rofi -dmenu -i -p "Volume: $vol%" -theme "$theme")

case $selected in
    "$toggle")
        pamixer -t
        ;;
    "$option_gui")
        pavucontrol &
        ;;
    "$option_sink")
        # List sinks
        sinks=$(pactl list sinks short | awk '{print $1, $2}')
        selected_sink=$(echo "$sinks" | rofi -dmenu -i -p "Select Output" -theme "$theme" | awk '{print $1}')
        if [ -n "$selected_sink" ]; then
            pactl set-default-sink "$selected_sink"
        fi
        ;;
esac
