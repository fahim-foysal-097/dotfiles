#!/bin/bash

# Function to fetch metadata
get_metadata() {
    playerctl metadata --format "{{ $1 }}" 2>/dev/null
}

# Function to determine the source and return an icon
get_source_icon() {
    trackid=$(get_metadata "mpris:trackid")
    case "$trackid" in
        *"spotify"*) echo "" ;;
        *"firefox"*) echo "󰈹" ;;
        *"chromium"*) echo "" ;;
        *) echo "" ;;
    esac
}

# Check if any player is active
if ! playerctl -l | grep -q .; then
    exit 0
fi

# Fetch metadata
title=$(get_metadata "xesam:title")
artist=$(get_metadata "xesam:artist")
album=$(get_metadata "xesam:album")
length=$(get_metadata "mpris:length")
status=$(playerctl status 2>/dev/null)
arturl=$(get_metadata "mpris:artUrl")
source_icon=$(get_source_icon)

# Format length from microseconds to minutes and seconds
if [[ -n "$length" ]]; then
    total_seconds=$((length / 1000000))
    minutes=$((total_seconds / 60))
    seconds=$((total_seconds % 60))
    duration=$(printf "%02d:%02d" $minutes $seconds)
else
    duration="00:00"
fi

# Determine status icon
case "$status" in
    "Playing") status_icon="" ;;
    "Paused") status_icon="" ;;
    *) status_icon="" ;;
esac

# Output formatted information
echo "$status_icon $title - $artist [$duration] $source_icon"
