#!/bin/bash

# Define aquí tus colores
COLOR_OSCURO="#282828"  # Para cuando la barra es blanca
COLOR_CLARO="#EBDBB2"   # Para cuando la barra es oscura (tu color actual)

# Aquí obtenemos el color de fondo de la i3bar desde tu config de i3
# Buscamos la línea 'background' dentro del bloque 'bar'
BG_COLOR=$(grep -A 20 "bar {" ~/.config/i3/config | grep "background" | awk '{print $2}' | head -n 1)

# Si el color es blanco (o muy claro), devolvemos el oscuro. Si no, el claro.
if [[ "$BG_COLOR" == "#ffffff" ]] || [[ "$BG_COLOR" == "white" ]]; then
    echo "$COLOR_OSCURO"
else
    echo "$COLOR_CLARO"
fi
