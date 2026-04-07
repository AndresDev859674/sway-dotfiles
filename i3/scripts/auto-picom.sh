#!/bin/bash

# --- CONFIGURACIÓN ---
CPU_THRESHOLD=75       # % de CPU
RAM_THRESHOLD=85       # % de RAM
GPU_THRESHOLD=80       # % de GPU
CHECK_INTERVAL=5
PAUSE_FILE="/tmp/auto_picom_paused"

# Obtener RAM total del sistema en KB
TOTAL_RAM=$(grep MemTotal /proc/meminfo | awk '{print $2}')

while true; do
    if [ -f "$PAUSE_FILE" ]; then
        sleep "$CHECK_INTERVAL"
        continue
    fi

    # 1. CÁLCULO DE CPU
    CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

    # 2. CÁLCULO DE RAM (%)
    FREE_RAM=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    RAM_USAGE=$(( 100 - (FREE_RAM * 100 / TOTAL_RAM) ))

    # 3. CÁLCULO DE GPU (%)
    if command -v nvidia-smi &> /dev/null; then
        # Para NVIDIA
        GPU_LOAD=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -n 1)
    elif [ -d /sys/class/drm/card0/device/gpu_busy_percent ]; then
        # Para AMD (algunos modelos)
        GPU_LOAD=$(cat /sys/class/drm/card0/device/gpu_busy_percent)
    else
        # Si no se detecta sensor, ignoramos la GPU (ponemos 0)
        GPU_LOAD=0
    fi

    PID=$(pgrep -x picom)

    # Lógica de apagado (Si CUALQUIERA supera el límite)
    if [ "$CPU_LOAD" -gt "$CPU_THRESHOLD" ] || [ "$RAM_USAGE" -gt "$RAM_THRESHOLD" ] || [ "$GPU_LOAD" -gt "$GPU_THRESHOLD" ]; then
        if [ -n "$PID" ]; then
            killall -9 picom
            REASON=""
            [ "$CPU_LOAD" -gt "$CPU_THRESHOLD" ] && REASON="CPU: $CPU_LOAD% "
            [ "$RAM_USAGE" -gt "$RAM_THRESHOLD" ] && REASON="${REASON}RAM: $RAM_USAGE% "
            [ "$GPU_LOAD" -gt "$GPU_THRESHOLD" ] && REASON="${REASON}GPU: $GPU_LOAD%"

            notify-send "Performance Mode" "Picom OFF - High Load detected: $REASON" -i processor -t 4000
        fi
    else
        # Lógica de encendido (Todo está bajo control)
        if [ -z "$PID" ]; then
            picom -b
            notify-send "Normal Mode" "System Stable. Picom ON" -i display -t 2000
        fi
    fi

    sleep "$CHECK_INTERVAL"
done
