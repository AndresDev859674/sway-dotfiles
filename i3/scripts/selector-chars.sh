#!/bin/bash

# Definimos los símbolos línea por línea para que tofi los separe bien
simbolos=$(cat <<EOF
@
#
$
&
_
-
+
=
/
\\
|
~
\`
^
[
]
{
}
(
)
<
>
;
:
"
'
¡
!
?
EOF
)

# Ejecutamos tofi con tu configuración dmenu-style
echo "$simbolos" | tofi \
  --anchor=top \
  --width=100% \
  --height=30 \
  --horizontal=true \
  --font-size=14 \
  --prompt-text=" copy char: " \
  --font=monospace \
  --outline-width=0 \
  --border-width=0 \
  --background-color="#000000AA" \
  --min-input-width=120 \
  --result-spacing=20 \
  --padding-top=0 \
  --padding-bottom=0 \
  --padding-left=0 \
  --padding-right=0 | wl-copy
