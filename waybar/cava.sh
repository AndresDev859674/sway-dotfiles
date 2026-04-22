#!/bin/bash

# Definición de barras (8 niveles)
bar=" ▂▃▄▅▆▇█"
dict="s/;//g;"

# Reducimos el número de barras para ahorrar espacio
num_bars=8

# Crear el "diccionario" para sed
for i in $(seq 0 $((${#bar} - 1))); do
    dict="${dict}s/$i/${bar:$i:1}/g;"
done

# Configuración temporal de cava
config_file="/tmp/waybar_cava_config"
echo "
[general]
bars = $num_bars

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" > $config_file

# Ejecución y procesado
cava -p $config_file | while read -r line; do
    echo "$line" | sed "$dict"
done
