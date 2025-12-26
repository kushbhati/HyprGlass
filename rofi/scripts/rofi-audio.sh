#!/bin/bash
# Rofi Audio Menu - Fast Loading

theme="$HOME/.config/rofi/menu.rasi"

# Show menu IMMEDIATELY with static options
options="Toggle Mute\nOutput Device\nInput Device\nAdvanced Controls (GUI)"

selected=$(echo -e "$options" | rofi -dmenu -i -p "󰕾 Audio" -theme "$theme")

case $selected in
    "Toggle Mute")
        pamixer -t
        ;;
    "Advanced Controls (GUI)")
        pavucontrol &
        ;;
    "Output Device")
        # Only fetch sinks when needed
        sinks=$(pactl list sinks short | awk '{print $2}')
        selected_sink=$(echo "$sinks" | rofi -dmenu -i -p "Select Output" -theme "$theme")
        if [ -n "$selected_sink" ]; then
            pactl set-default-sink "$selected_sink"
        fi
        ;;
    "Input Device")
        # Only fetch sources when needed
        sources=$(pactl list sources short | grep -v monitor | awk '{print $2}')
        selected_source=$(echo "$sources" | rofi -dmenu -i -p "Select Input" -theme "$theme")
        if [ -n "$selected_source" ]; then
            pactl set-default-source "$selected_source"
        fi
        ;;
esac
