#!/bin/bash

I3_CONFIG="$HOME/.config/i3/config"
SWAY_CONFIG="$HOME/.config/sway/config"

# 1. Environment detection
if [ -n "$SWAYSOCK" ]; then
    CONFIG="$SWAY_CONFIG"
    RELOAD_CMD="swaymsg reload"
    ENV="Sway/FX"
else
    CONFIG="$I3_CONFIG"
    RELOAD_CMD="i3-msg reload"
    ENV="i3wm"
fi

# 2. Toggle logic
if grep -q "position top" "$CONFIG"; then
    sed -i 's/position top/position bottom/' "$CONFIG"
    NEW_POS="Bottom"
else
    sed -i 's/position bottom/position top/' "$CONFIG"
    NEW_POS="Top"
fi

# 3. Apply and notify
$RELOAD_CMD
notify-send "Bar Updated" "Environment: $ENV\nPosition: $NEW_POS" -t 1000 -a "System"
