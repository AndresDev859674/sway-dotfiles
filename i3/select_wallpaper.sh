#!/bin/bash

WP_DIR="$HOME/i3-wallpapers"
CACHE_FILE="$HOME/.current_wallpaper"

# 1. Generar lista: Nombre del archivo + Ruta oculta como icono
# Usamos un bucle para construir la entrada de Rofi correctamente
LISTA=""
for img in "$WP_DIR"/*.{png,jpg,jpeg,webp,gif,svg}; do
    [ -e "$img" ] || continue
    BN=$(basename "$img")
    # Formato Rofi: "Nombre\0icon\x1f/ruta/completa"
    LISTA+="${BN}\x00icon\x1f${img}\n"
done

# 2. Mostrar Rofi en modo cuadrícula con nombres cortos
CHOICE=$(echo -en "$LISTA" | rofi -dmenu -i -p "󰸉 Select Wallpaper:" \
    -show-icons \
    -theme-str 'listview { columns: 3; lines: 3; spacing: 10px; }
                element { orientation: vertical; border-radius: 8px; }
                element-icon { size: 120px; horizontal-align: 0.5; }
                element-text { horizontal-align: 0.5; }')

# Si el usuario cancela, salir
if [ -z "$CHOICE" ]; then
    exit 0
fi

# 3. Reconstruir la ruta completa para aplicar el fondo
SELECTED_WP="$WP_DIR/$CHOICE"

# 4. Guardar y Aplicar según el entorno
echo "$SELECTED_WP" > "$CACHE_FILE"

if [ "$XDG_CURRENT_DESKTOP" == "sway" ] || [ -n "$SWAYSOCK" ]; then
    awww img "$SELECTED_WP" --transition-type outer --transition-duration 1.0
    DESKTOP_ENV="Sway"
else
    feh --bg-fill "$SELECTED_WP"
    DESKTOP_ENV="i3wm"
fi

# Notificación limpia
notify-send "Wallpaper Updated" "Archivo: $CHOICE" -t 2000 -i "$SELECTED_WP"
