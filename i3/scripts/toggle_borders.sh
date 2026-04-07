#!/bin/bash

# 1. Detect Environment (Sway or i3)
if [ -n "$SWAYSOCK" ]; then
    MSG_CMD="swaymsg"
    CONFIG_FILE="$HOME/.config/sway/config"
elif [ -n "$I3SOCK" ] || pgrep -x "i3" > /dev/null; then
    MSG_CMD="i3-msg"
    CONFIG_FILE="$HOME/.config/i3/config"
else
    # Fallback to i3 if unsure
    MSG_CMD="i3-msg"
    CONFIG_FILE="$HOME/.config/i3/config"
fi

# 2. Check if config exists
if [ ! -f "$CONFIG_FILE" ]; then
    notify-send "WM Config" "Error: Configuration file not found at $CONFIG_FILE" -u critical
    exit 1
fi

# 3. Toggle Logic
if grep -q "^default_border pixel" "$CONFIG_FILE"; then
    # Change to normal (Show Title Bar)
    sed -i 's/^default_border pixel.*/default_border normal 2/' "$CONFIG_FILE"
    $MSG_CMD "default_border normal 2"
    notify-send "Window Manager" "Title bars: ENABLED" -t 2000
else
    # Change to pixel (Remove Title Bar)
    sed -i 's/^default_border normal.*/default_border pixel 2/' "$CONFIG_FILE"

    # Ensure the line exists if it was missing
    if ! grep -q "default_border" "$CONFIG_FILE"; then
        echo "default_border pixel 2" >> "$CONFIG_FILE"
    fi

    $MSG_CMD "default_border pixel 2"
    notify-send "Window Manager" "Title bars: REMOVED" -t 2000
fi

# 4. Refresh WM
$MSG_CMD reload
