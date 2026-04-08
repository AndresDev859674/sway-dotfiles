#!/bin/bash

THRESHOLD=5

while true; do
    # 1. Obtenemos el ID de tu usuario actual
    MY_UID=$(id -u)

    # 2. Buscamos procesos en estado 'D' que pertenezcan SOLO a tu UID
    # Usamos -w para que no trunque nombres largos
    ZOMBIES=$(ps -u "$MY_UID" -eo state,comm | grep "^D" | awk '{print $2}')

    if [ ! -z "$ZOMBIES" ]; then
        # 3. Verificamos si el proceso realmente tiene una ventana en Sway
        # Esto es el filtro definitivo para evitar servicios de fondo
        for ZOMBIE in $ZOMBIES; do
            IS_WINDOW=$(swaymsg -t get_tree | grep -i "$ZOMBIE")

            if [ ! -z "$IS_WINDOW" ]; then
                notify-send -u critical "Process Hanged" "The application [$ZOMBIES] is not responding."
            fi
        done
    fi

    sleep $THRESHOLD
done
