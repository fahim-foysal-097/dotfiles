### Clipboard

#!/bin/bash

# Check if wofi is running
if pgrep -x "wofi" > /dev/null; then
    # If wofi is running, close it
    pkill -x "wofi"
    exit 0
fi

# Define the clear option
CLEAR_OPTION="󰆴 Clear Clipboard History"

# Generate the clipboard history list
history=$(cliphist list)

# Combine the clear option with the clipboard history
menu="$CLEAR_OPTION\n$history"

# Display the menu using wofi
selection=$(echo -e "$menu" | wofi --dmenu --prompt="Clipboard History")

# Handle the selection
if [[ "$selection" == "$CLEAR_OPTION" ]]; then
    # Clear the clipboard history
    cliphist wipe
    notify-send "Clipboard history cleared."
elif [[ -n "$selection" ]]; then
    # Extract the ID from the selection
    id=$(echo "$selection" | awk '{print $1}')
    # Decode and copy the selected item to the clipboard
    cliphist decode "$id" | wl-copy
fi

