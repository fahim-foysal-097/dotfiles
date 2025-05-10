### Control powermenu using wofi

#!/bin/bash

# Check if Wofi is already running
if pgrep -x wofi > /dev/null; then
    # Kill wofi if it's running
    pkill -x wofi
    exit 0
fi

chosen=$(echo -e " Lock\n⏾ Suspend\n Logout\n Reboot\n Shutdown" | wofi --dmenu --height 340 --width 280  --insensitive --prompt "Power" )

case "$chosen" in
    " Lock")
        hyprlock
        ;;
    "⏾ Suspend")
        # Optional: lock before suspending
        systemctl suspend
        ;;
    " Logout")
        hyprctl dispatch exit
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Shutdown")
        systemctl poweroff
        ;;
esac

