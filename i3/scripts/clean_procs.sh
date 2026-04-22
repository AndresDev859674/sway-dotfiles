#!/bin/bash

# Nombre de este script para evitar que se mate a sí mismo
SCRIPT_NAME=$(basename "$0")

echo "Guard de Sway iniciado. Revisando procesos cada 10 segundos..."

while true; do
    # --- 1. LÓGICA PARA AUTOTILING ---
    # Contamos cuántas instancias de autotiling existen
    AUTO_COUNT=$(pgrep -cf "autotiling")

    if [ "$AUTO_COUNT" -gt 1 ]; then
        echo "[!] Multiples instancias de autotiling detectadas ($AUTO_COUNT). Reiniciando..."
        pkill -f "autotiling"
        sleep 0.5
        autotiling -w 1 3 5 7 9 &
    elif [ "$AUTO_COUNT" -eq 0 ]; then
        echo "[?] Autotiling no estaba ejecutándose. Iniciando..."
        autotiling -w 1 3 5 7 9 &
    fi

    # --- 2. LÓGICA PARA SWAY-CHECK-ZOMBIE.SH ---
    # Obtenemos los PIDs, excluyendo este mismo script ($$) para evitar problemas
    ZOMBIE_PIDS=$(pgrep -f "sway-check-zombie.sh" | grep -v "^$$" | sort -n)
    Z_COUNT=$(echo "$ZOMBIE_PIDS" | wc -w)

    if [ "$Z_COUNT" -gt 1 ]; then
        # Conservamos el más antiguo (primer PID) y matamos los demás
        TO_KILL=$(echo "$ZOMBIE_PIDS" | tail -n +2)
        echo "[!] Limpiando $Z_COUNT procesos zombie duplicados..."
        kill $TO_KILL 2>/dev/null
    fi

    # --- 3. LÓGICA PARA cava.sh ---
    # Obtenemos los PIDs, excluyendo este mismo script ($$) para evitar problemas
    CAVA_PIDS=$(pgrep -f "cava.sh" | grep -v "^$$" | sort -n)
    C_COUNT=$(echo "$CAVA_PIDS" | wc -w)

    if [ "$CAVA_COUNT" -gt 1 ]; then
        # Conservamos el más antiguo (primer PID) y matamos los demás
        TO_KILL=$(echo "$CAVA_PIDS" | tail -n +2)
        echo "[!] Limpiando $C_COUNT procesos zombie duplicados..."
        kill $TO_KILL 2>/dev/null
    fi

    # --- 3. ESPERA ---
    sleep 10
done
