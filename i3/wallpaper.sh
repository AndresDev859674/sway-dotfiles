#!/bin/bash

# Directorio de fondos y archivo de estado
WP_DIR="$HOME/i3-wallpapers"
STATE_FILE="$HOME/.current_wallpaper"

# 1. Obtener todas las imágenes en un array de forma segura (soporta espacios)
mapfile -t WALLPAPERS < <(ls "$WP_DIR"/*.{png,jpg,jpeg,webp,jpegxl,pnm,tga,tiff,avif,gif,bmp,svg} 2>/dev/null)

# Si no hay fondos, salir
if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    notify-send "Error" "No images were found in $WP_DIR" -u critical
    exit 1
fi

# 2. Leer el wallpaper actual
CURRENT=$(cat "$STATE_FILE" 2>/dev/null)

# 3. Buscar el índice actual y calcular el siguiente
NEXT_INDEX=0
for i in "${!WALLPAPERS[@]}"; do
   if [[ "${WALLPAPERS[$i]}" == "$CURRENT" ]]; then
       NEXT_INDEX=$(( (i + 1) % ${#WALLPAPERS[@]} ))
       break
   fi
done

# Seleccionar el nuevo wallpaper
NEW_WP="${WALLPAPERS[$NEXT_INDEX]}"
WP_NAME=$(basename "$NEW_WP")

# 4. Aplicar según el entorno (Sway o i3)
if [ -n "$SWAYSOCK" ]; then
    # --- Modo Sway con awww ---
    awww img "$NEW_WP" --transition-type wipe --transition-duration 0.3
    DESKTOP="Sway"
else
    # --- Modo i3 ---
    feh --bg-fill "$NEW_WP"
    DESKTOP="i3wm"
fi


# 5. Guardar de forma persistente
echo "$NEW_WP" > "$STATE_FILE"

# 6. Notificación con miniatura real
notify-send "Wallpaper: $DESKTOP" "Next: $WP_NAME" -t 1500 -a "System" -i "$NEW_WP"
