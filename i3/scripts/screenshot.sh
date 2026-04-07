#!/usr/bin/env bash

# 1. Define the destination (using XDG standard or fallback)
SCREENSHOT_DIR="${HOME}/Pictures"

# 2. Auto-create directory if it doesn't exist
if [ ! -d "$SCREENSHOT_DIR" ]; then
    mkdir -p "$SCREENSHOT_DIR"
fi

# 3. Generate filename with timestamp
FILENAME="${SCREENSHOT_DIR}/screenshot_$(date +%Y%m%d_%H%M%S).png"

# 4. Handle arguments (full or select)
if [ "$1" == "full" ]; then
    maim "$FILENAME"
elif [ "$1" == "select" ]; then
    # -u hides the cursor for a cleaner look
    maim -s -u "$FILENAME"
fi

# 5. If the file was created successfully
if [ -f "$FILENAME" ]; then
    # Copy to clipboard
    xclip -selection clipboard -t image/png -i "$FILENAME"
    # English notification
    notify-send "Screenshot Saved" "Stored in ~/Pictures\nand copied to clipboard." -i camera-photo
fi
