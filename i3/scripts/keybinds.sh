#!/bin/bash

# Path to your Sway config file
CONFIG_FILE="$HOME/.config/sway/config"

# Check if config exists
if [ ! -f "$CONFIG_FILE" ]; then
    notify-send "Error" "Sway config not found at $CONFIG_FILE"
    exit 1
fi

# Extract keybinds and descriptions
# Logic: It finds lines with 'bindsym', removes extra flags like --no-startup-id,
# and looks at the lines above to find comments as descriptions.
list_keys=$(grep -B 1 "bindsym" "$CONFIG_FILE" | \
    sed 's/--no-startup-id //g' | \
    awk '
    # If line starts with #, store it as description (removing the # and spaces)
    /^#/{
        gsub(/^#+[ \t]*/, "");
        desc=$0;
        next
    }
    # If line has bindsym, print the key combo and the stored description
    /bindsym/{
        gsub("bindsym ", "", $0);
        # Formatting for Rofi: Key Combo | Description
        if (desc != "") {
            printf "%-35s │ %s\n", $0, desc
        } else {
            printf "%-35s │ %s\n", $0, "No description available"
        }
        desc="" # Reset description for next bind
    }')

# Launch Rofi with custom theme string to match your blur/corners
selected=$(echo -e "$list_keys" | rofi -dmenu \
    -i \
    -p "Sway Shortcuts" \
    -mesg "Showing keybindings defined in $CONFIG_FILE, TIP : Mod is Supr or Win Key, Mod1 is Alt, To identify what they do, look at the name of the .sh file or the behavior of the keys." \
    -theme-str 'window { width: 50%; border-radius: 10px; } listview { lines: 15; }' \
    -markup-rows)

# Optional: If you select one, copy the key to clipboard
if [ -n "$selected" ]; then
    echo "$selected" | awk -F'│' '{print $1}' | xargs | wl-copy
    notify-send "Sway Manual" "Keybind copied to clipboard"
fi
