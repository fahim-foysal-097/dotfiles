### Random Wallpaper Changer

#!/bin/bash

WALLPAPER_DIR="$HOME/.config/backgrounds/"

# Function to set a random wallpaper on all monitors
set_random_wallpaper() {
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.webp' \) | shuf -n 1)
    if [ -n "$WALLPAPER" ]; then
        hyprctl hyprpaper preload "$WALLPAPER"
        hyprctl hyprpaper wallpaper ",$WALLPAPER"
        sleep 1
        hyprctl hyprpaper unload unused
    fi
}

# Change wallpaper every x seconds
while true; do
    sleep 300
    set_random_wallpaper
done

