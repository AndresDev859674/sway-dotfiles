#!/usr/bin/env bash

# 1. Definir destino
SCREENSHOT_DIR="${HOME}/Pictures"
mkdir -p "$SCREENSHOT_DIR"

# 2. Generar nombre de archivo
FILENAME="${SCREENSHOT_DIR}/screenshot_$(date +%Y%m%d_%H%M%S).png"

# 3. Detectar el entorno (X11 o Wayland)
# Usamos XDG_SESSION_TYPE como indicador principal
SESSION_TYPE="${XDG_SESSION_TYPE:-x11}"

take_screenshot() {
    local mode=$1 # "full" o "select"

    if [[ "$SESSION_TYPE" == "wayland" ]]; then
        # Lógica para WAYLAND
        if [ "$mode" == "full" ]; then
            grim "$FILENAME"
        else
            grim -g "$(slurp)" "$FILENAME"
        fi
        # Copiar al portapapeles en Wayland
        cat "$FILENAME" | wl-copy
    else
        # Lógica para X11 (Tu código original mejorado)
        if [ "$mode" == "full" ]; then
            maim "$FILENAME"
        else
            maim -s -u "$FILENAME"
        fi
        # Copiar al portapapeles en X11
        xclip -selection clipboard -t image/png -i "$FILENAME"
    fi
}

# 4. Ejecutar según el argumento
if [[ "$1" == "full" || "$1" == "select" ]]; then
    take_screenshot "$1"
else
    echo "Uso: $0 {full|select}"
    exit 1
fi

# 5. Notificación y verificación
if [ -f "$FILENAME" ]; then
    notify-send "Captura Guardada" "Guardada en ~/Pictures y copiada al portapapeles." -i camera-photo
else
    notify-send "Error" "No se pudo crear la captura de pantalla." -u critical
fi
