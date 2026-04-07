#!/bin/bash

PAUSE_FILE="/tmp/auto_picom_paused"

if pgrep -x "picom" > /dev/null
then
    pkill -x picom
    notify-send "Manual Mode" "Picom & Auto-Monitor: DISABLED" -i processor
else
    # rm -f "$PAUSE_FILE"
    picom -b
    notify-send "Manual Mode" "Picom & Auto-Monitor: ENABLED" -i display
fi
