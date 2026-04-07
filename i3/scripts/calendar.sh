#!/bin/bash

# Configuración de colores y estilo
BG="#282828"
FG="#ebdbb2"
ACCENT="#d79921"

# Generamos el calendario con el mes y año actual
CAL=$(cal -m | sed 's/^/  /')

# Lanzamos Rofi
echo "$CAL" | rofi -dmenu -p "📅 $(date '+%B %Y')" \
    -font "JetBrainsMono Nerd Font 11" \
    -theme-str "
        window { width: 280px; border: 2px; border-color: $ACCENT; background-color: $BG; }
        mainbox { children: [inputbar, listview]; }
        inputbar { background-color: $ACCENT; children: [prompt]; padding: 8px; }
        prompt { text-color: $BG; font: 'JetBrainsMono Nerd Font Bold 12'; }
        listview { lines: 8; scrollbar: false; padding: 10px; }
        element { padding: 2px; text-color: $FG; background-color: $BG; }
        element selected { background-color: $BG; text-color: $ACCENT; }
        " > /dev/null

# Lo que se muestra en i3blocks
date '+%A %d-%m-%Y %H:%M:%S'
