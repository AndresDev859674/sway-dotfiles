#!/bin/bash

# Esperar un momento a que el sistema de audio cargue tras el login
sleep 1

# Matar instancias previas para evitar duplicados
pkill -x cava

# Crear config temporal
cat <<EOF > /tmp/cava_config

[general]
bars = 10
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF


# Ejecución con buffering deshabilitado y manejo de salida
# Usamos un bucle que reemplaza caracteres de forma más eficiente
stdbuf -i0 -o0 -e0 cava -p /tmp/cava_config | while read -r line; do
    echo "$line" | sed 's/;//g; s/0/ /g; s/1/▂/g; s/2/▃/g; s/3/▄/g; s/4/▅/g; s/5/▆/g; s/6/▇/g; s/7/█/g'
done 