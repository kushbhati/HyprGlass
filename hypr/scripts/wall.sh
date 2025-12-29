#!/bin/bash
hyprpaper & sleep 1
WALL=$(find ~/Pictures/Hyprpaper -type f | shuf -n 1)
hyprctl hyprpaper preload "$WALL"
hyprctl hyprpaper wallpaper ",$WALL"
