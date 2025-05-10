#!/bin/bash

# Check if Wofi is running
if pgrep -x "wofi" > /dev/null; then
    # If running, close Wofi
    pkill -x wofi
else
    # If not running, launch Wofi
    wofi --show drun
fi

