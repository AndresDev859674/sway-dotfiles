#!/bin/bash

# Color configuration (Gruvbox palette)
BG="#282828"
FG="#ebdbb2"
ACCENT="#d79921"

# Generate the multiplication table vertically
TABLE=""
for i in {1..10}; do
    # Visual separator for each table
    TABLE+="--- TABLE OF $i ---\n"
    for j in {1..10}; do
        RESULT=$((i * j))
        # Format: i x j = result (vertically aligned)
        TABLE+=$(printf "%2d  x  %2d  =  %3d\n" $i $j $RESULT)
        TABLE+="\n"
    done
    # Extra space between tables for better readability
    TABLE+="\n"
done

# Launch Rofi with custom English styling
echo -e "$TABLE" | rofi -dmenu -p "🔢 Multiplication Tables" \
    -font "JetBrainsMono Nerd Font 11" \
    -theme-str "
    window { width: 350px; border: 2px; border-color: $ACCENT; background-color: $BG; }
    mainbox { children: [inputbar, listview]; }
    inputbar { background-color: $ACCENT; children: [prompt]; padding: 10px; }
    prompt { text-color: $BG; font: 'JetBrainsMono Nerd Font Bold 12'; }
    listview { lines: 20; scrollbar: true; padding: 10px; }
    element { padding: 4px; text-color: $FG; background-color: $BG; }
    element selected { background-color: $BG; text-color: $ACCENT; border: 1px; border-color: $ACCENT; }
    " > /dev/null
