#!/bin/bash

# Check if swaync is in Do Not Disturb mode
if ! swaync-client -D | grep -q "true"; then
    play '~/.config/swaync/notify-sound.wav'
fi
