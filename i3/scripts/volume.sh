#!/bin/bash
# Aumentar volumen
if [ "$1" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi
# Bajar volumen
if [ "$1" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
fi

# Obtener el volumen actual para mostrarlo en swayosd
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | awk '{print $5}' | tr -d ' %')

# Enviar el valor al OSD
swayosd-client --output-volume $vol
