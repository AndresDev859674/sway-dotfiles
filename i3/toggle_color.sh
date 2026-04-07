#!/bin/bash

# --- CONFIG DETECTION ---
if [ -n "$SWAYSOCK" ]; then
    CONFIG="$HOME/.config/sway/config"
    CONFIG_STATUS="$HOME/.config/i3status-rust/config.toml"
    RELOAD_CMD="swaymsg reload"
    ENV="SwayFX"
else
    CONFIG="$HOME/.config/i3/config"
    CONFIG_STATUS="$HOME/.config/i3status-rust/config.toml"
    RELOAD_CMD="i3-msg reload"
    ENV="i3wm"
fi

# --- THEME DEFINITIONS ---
# Formato: WM Bar (BG, StatusLine, Separator, FocusedWS, InactiveWS, UrgentWS) + Status-Rust (BG, FG, BaseTheme)

# Tema base por defecto para i3status-rust
DEFAULT_ST_THEME="dracula"

# Color Urgente Global (Default)
URGENT_DEFAULT="#ff5555 #ff5555 #ffffff"

# 1. ORIGINAL (Transparent Dracula-ish)
BG_ORIGINAL="#282a36CC"; SL_ORIGINAL="#f8f8f2"; SP_ORIGINAL="#44475a"
WF_ORIGINAL="#44475a #44475a #f8f8f2"; WI_ORIGINAL="#282a36 #282a36 #6272a4"
ST_BG_ORIGINAL="#282a36"; ST_FG_ORIGINAL="#6272a4"

# 2. SOLID
BG_SOLID="#282a36"

# 3. FULL DARK (Black)
BG_BLACK="#000000"; SL_BLACK="#666666"; SP_BLACK="#222222"
WF_BLACK="#333333 #333333 #ffffff"; WI_BLACK="#000000 #000000 #444444"
ST_BG_BLACK="#000000"; ST_FG_BLACK="#666666"

# 3.1 FULL DARK WITH TRANSPARENT (Black)
BG_BLACKT="#000000AA"; SL_BLACKT="#666666"; SP_BLACKT="#222222"
WF_BLACKT="#333333 #333333 #ffffff"; WI_BLACKT="#000000 #000000 #444444"
ST_BG_BLACKT="#000000"; ST_FG_BLACKT="#666666"

# 3.2 GLASS
BG_GLASS="#FFFFFF00"; SL_GLASS="#666666"; SP_GLASS="#222222"
WF_GLASS="#123456AA #123456AA #ffffff"; WI_GLASS="#FFFFFF00 #FFFFFF00 #ffffff"
ST_BG_GLASS="#FFFFFF00"; ST_FG_GLASS="#ffffff"

# 4. MONOCHROME
BG_MONO="#222222"; SL_MONO="#ffffff"; SP_MONO="#444444"
WF_MONO="#ffffff #ffffff #000000"; WI_MONO="#222222 #222222 #888888"
ST_BG_MONO="#222222"; ST_FG_MONO="#ffffff"

# 5. WHITE (Light)
BG_WHITE="#ffffff"; SL_WHITE="#282a36"; SP_WHITE="#dddddd"
WF_WHITE="#ffffff #ffffff #282a36"; WI_WHITE="#ffffff #ffffff #bbbbbb"
ST_BG_WHITE="#ffffff"; ST_FG_WHITE="#282a36"

# 6. NORD
BG_NORD="#2e3440"; SL_NORD="#eceff4"; SP_NORD="#4c566a"
WF_NORD="#88c0d0 #88c0d0 #2e3440"; WI_NORD="#2e3440 #2e3440 #d8dee9"
ST_BG_NORD="#2e3440"; ST_FG_NORD="#eceff4"

# 7. NORDIC
BG_NORDIC="#1a1c24"; SL_NORDIC="#d8dee9"; SP_NORDIC="#3b4252"
WF_NORDIC="#5e81ac #5e81ac #eceff4"; WI_NORDIC="#1a1c24 #1a1c24 #616e88"
ST_BG_NORDIC="#1a1c24"; ST_FG_NORDIC="#d8dee9"

# 8. CATPPUCCIN LATTE
BG_LATTE="#eff1f5"; SL_LATTE="#4c4f69"; SP_LATTE="#9ca0b0"
WF_LATTE="#1e66f5 #1e66f5 #eff1f5"; WI_LATTE="#eff1f5 #eff1f5 #7c7f93"
ST_BG_LATTE="#eff1f5"; ST_FG_LATTE="#4c4f69"

# 9. CATPPUCCIN FRAPPÉ
BG_FRAPPE="#303446"; SL_FRAPPE="#c6d0f5"; SP_FRAPPE="#414559"
WF_FRAPPE="#8ca0f3 #8ca0f3 #303446"; WI_FRAPPE="#303446 #303446 #838ba7"
ST_BG_FRAPPE="#303446"; ST_FG_FRAPPE="#c6d0f5"

# 10. CATPPUCCIN MACCHIATO
BG_MACCHIATO="#24273a"; SL_MACCHIATO="#cad3f5"; SP_MACCHIATO="#363a4f"
WF_MACCHIATO="#8aadf4 #8aadf4 #24273a"; WI_MACCHIATO="#24273a #24273a #8087a2"
ST_BG_MACCHIATO="#24273a"; ST_FG_MACCHIATO="#cad3f5"

# 11. CATPPUCCIN MOCHA
BG_MOCHA="#1e1e2e"; SL_MOCHA="#cdd6f4"; SP_MOCHA="#313244"
WF_MOCHA="#89b4fa #89b4fa #1e1e2e"; WI_MOCHA="#1e1e2e #1e1e2e #7f849c"
ST_BG_MOCHA="#1e1e2e"; ST_FG_MOCHA="#cdd6f4"

# 12. GRUVBOX
BG_GRUVBOX="#282828"; SL_GRUVBOX="#ebdbb2"; SP_GRUVBOX="#504945"
WF_GRUVBOX="#d65d0e #d65d0e #ebdbb2"; WI_GRUVBOX="#282828 #282828 #928374"
ST_BG_GRUVBOX="#282828"; ST_FG_GRUVBOX="#ebdbb2"
ST_THEME_GRUVBOX="gruvbox-dark"

# 12.1 GRUVBOX LIGHT
BG_GRUVBOXLI="#fbf1c7"; SL_GRUVBOXLI="#ebdbb2"; SP_GRUVBOXLI="#504945"
WF_GRUVBOXLI="#af3a03 #af3a03 #ebdbb2"; WI_GRUVBOXLI="#fbf1c7 #fbf1c7 #3c3836"
URGENT_GRUVBOXLI="#9d0006 #9d0006 #fbf1c7" # Tu urgent personalizado
ST_BG_GRUVBOXLI=""; ST_FG_GRUVBOXLI="#3c3836"
ST_THEME_GRUVBOXLI="gruvbox-light"

# 13. TOKYO NIGHT
BG_TOKYO="#1a1b26"; SL_TOKYO="#a9b1d6"; SP_TOKYO="#414868"
WF_TOKYO="#7aa2f7 #7aa2f7 #1a1b26"; WI_TOKYO="#1a1b26 #1a1b26 #565f89"
ST_BG_TOKYO="#1a1b26"; ST_FG_TOKYO="#a9b1d6"

# 14. SOLARIZED DARK
BG_SOLDARK="#002b36"; SL_SOLDARK="#839496"; SP_SOLDARK="#073642"
WF_SOLDARK="#268bd2 #268bd2 #fdf6e3"; WI_SOLDARK="#002b36 #002b36 #586e75"
ST_BG_SOLDARK="#002b36"; ST_FG_SOLDARK="#839496"
ST_THEME_SOLDARK="solarized-dark"

# 15. ROSÉ PINE
BG_ROSE="#191724"; SL_ROSE="#e0def4"; SP_ROSE="#26233a"
WF_ROSE="#ebbcba #ebbcba #191724"; WI_ROSE="#191724 #191724 #908caa"
ST_BG_ROSE="#191724"; ST_FG_ROSE="#e0def4"

# 16. DRACULA (Standard Opaque)
BG_DRACULA="#44475a"; SL_DRACULA="#f8f8f2"; SP_DRACULA="#6272a4"
WF_DRACULA="#bd93f9 #bd93f9 #282a36"; WI_DRACULA="#282a36 #282a36 #f8f8f2"
ST_BG_DRACULA="#44475a"; ST_FG_DRACULA="#f8f8f2"

# 17. ANDREW
BG_ANDREW="#123456AA"; SL_ANDREW="#666666"; SP_ANDREW="#222222"
WF_ANDREW="#abcdef #abcdef #ffffff"; WI_ANDREW="#123456 #123456 #abcdef"
ST_BG_ANDREW="#123456"; ST_FG_ANDREW="#abcdef"

apply_theme() {
    # 1. Actualizar Configuración de la Barra del WM (i3/Sway)
    # $1:BG, $2:SL, $3:SP, $4:WF, $5:WI, $6:URGENT
    sed -i "/bar {/,/}/ s/background .*/background $1/" "$CONFIG"
    sed -i "/bar {/,/}/ s/statusline .*/statusline $2/" "$CONFIG"
    sed -i "/bar {/,/}/ s/separator .*/separator $3/" "$CONFIG"
    sed -i "/bar {/,/}/ s/focused_workspace .*/focused_workspace $4/" "$CONFIG"
    sed -i "/bar {/,/}/ s/inactive_workspace .*/inactive_workspace $5/" "$CONFIG"
    sed -i "/bar {/,/}/ s/urgent_workspace .*/urgent_workspace $6/" "$CONFIG"

    # 2. Actualizar i3status-rust (si el archivo existe)
    # $7:ST_BG, $8:ST_FG, $9:ST_THEME
    if [ -f "$CONFIG_STATUS" ]; then
        sed -i "s/idle_bg = .*/idle_bg = \"$7\"/" "$CONFIG_STATUS"
        sed -i "s/idle_fg = .*/idle_fg = \"$8\"/" "$CONFIG_STATUS"
        sed -i "s/theme = .*/theme = \"$9\"/" "$CONFIG_STATUS"
    fi
}

# --- CYCLE LOGIC ---
if grep -wq "background $BG_ORIGINAL" "$CONFIG"; then
    apply_theme "$BG_SOLID" "$SL_ORIGINAL" "$SP_ORIGINAL" "$WF_ORIGINAL" "$WI_ORIGINAL" "$URGENT_DEFAULT" "$ST_BG_ORIGINAL" "$ST_FG_ORIGINAL" "$DEFAULT_ST_THEME"
    MODE="Solid"
elif grep -wq "background $BG_SOLID" "$CONFIG"; then
    apply_theme "$BG_BLACK" "$SL_BLACK" "$SP_BLACK" "$WF_BLACK" "$WI_BLACK" "$URGENT_DEFAULT" "$ST_BG_BLACK" "$ST_FG_BLACK" "$DEFAULT_ST_THEME"
    MODE="Full Dark"
elif grep -wq "background $BG_BLACK" "$CONFIG"; then
    apply_theme "$BG_BLACKT" "$SL_BLACKT" "$SP_BLACKT" "$WF_BLACKT" "$WI_BLACKT" "$URGENT_DEFAULT" "$ST_BG_BLACKT" "$ST_FG_BLACKT" "$DEFAULT_ST_THEME"
    MODE="Full Dark With Transparent"
elif grep -wq "background $BG_BLACKT" "$CONFIG"; then
    apply_theme "$BG_GLASS" "$SL_GLASS" "$SP_GLASS" "$WF_GLASS" "$WI_GLASS" "$URGENT_DEFAULT" "$ST_BG_GLASS" "$ST_FG_GLASS" "$DEFAULT_ST_THEME"
    MODE="Glassy"
elif grep -iwq "background $BG_GLASS" "$CONFIG"; then
    apply_theme "$BG_MONO" "$SL_MONO" "$SP_MONO" "$WF_MONO" "$WI_MONO" "$URGENT_DEFAULT" "$ST_BG_MONO" "$ST_FG_MONO" "$DEFAULT_ST_THEME"
    MODE="Monochrome"
elif grep -wq "background $BG_MONO" "$CONFIG"; then
    apply_theme "$BG_WHITE" "$SL_WHITE" "$SP_WHITE" "$WF_WHITE" "$WI_WHITE" "$URGENT_DEFAULT" "$ST_BG_WHITE" "$ST_FG_WHITE" "$DEFAULT_ST_THEME"
    MODE="White"
elif grep -wq "background $BG_WHITE" "$CONFIG"; then
    apply_theme "$BG_NORD" "$SL_NORD" "$SP_NORD" "$WF_NORD" "$WI_NORD" "$URGENT_DEFAULT" "$ST_BG_NORD" "$ST_FG_NORD" "$DEFAULT_ST_THEME"
    MODE="Nord"
elif grep -wq "background $BG_NORD" "$CONFIG"; then
    apply_theme "$BG_NORDIC" "$SL_NORDIC" "$SP_NORDIC" "$WF_NORDIC" "$WI_NORDIC" "$URGENT_DEFAULT" "$ST_BG_NORDIC" "$ST_FG_NORDIC" "$DEFAULT_ST_THEME"
    MODE="Nordic"
elif grep -wq "background $BG_NORDIC" "$CONFIG"; then
    apply_theme "$BG_LATTE" "$SL_LATTE" "$SP_LATTE" "$WF_LATTE" "$WI_LATTE" "$URGENT_DEFAULT" "$ST_BG_LATTE" "$ST_FG_LATTE" "$DEFAULT_ST_THEME"
    MODE="Catppuccin Latte"
elif grep -wq "background $BG_LATTE" "$CONFIG"; then
    apply_theme "$BG_FRAPPE" "$SL_FRAPPE" "$SP_FRAPPE" "$WF_FRAPPE" "$WI_FRAPPE" "$URGENT_DEFAULT" "$ST_BG_FRAPPE" "$ST_FG_FRAPPE" "$DEFAULT_ST_THEME"
    MODE="Catppuccin Frappé"
elif grep -wq "background $BG_FRAPPE" "$CONFIG"; then
    apply_theme "$BG_MACCHIATO" "$SL_MACCHIATO" "$SP_MACCHIATO" "$WF_MACCHIATO" "$WI_MACCHIATO" "$URGENT_DEFAULT" "$ST_BG_MACCHIATO" "$ST_FG_MACCHIATO" "$DEFAULT_ST_THEME"
    MODE="Catppuccin Macchiato"
elif grep -wq "background $BG_MACCHIATO" "$CONFIG"; then
    apply_theme "$BG_MOCHA" "$SL_MOCHA" "$SP_MOCHA" "$WF_MOCHA" "$WI_MOCHA" "$URGENT_DEFAULT" "$ST_BG_MOCHA" "$ST_FG_MOCHA" "$DEFAULT_ST_THEME"
    MODE="Catppuccin Mocha"
elif grep -wq "background $BG_MOCHA" "$CONFIG"; then
    apply_theme "$BG_GRUVBOX" "$SL_GRUVBOX" "$SP_GRUVBOX" "$WF_GRUVBOX" "$WI_GRUVBOX" "$URGENT_DEFAULT" "$ST_BG_GRUVBOX" "$ST_FG_GRUVBOX" "$ST_THEME_GRUVBOX"
    MODE="Gruvbox"
elif grep -wq "background $BG_GRUVBOX" "$CONFIG"; then
    # GRUVBOX LIGHT: Usa su color urgente específico
    apply_theme "$BG_GRUVBOXLI" "$SL_GRUVBOXLI" "$SP_GRUVBOXLI" "$WF_GRUVBOXLI" "$WI_GRUVBOXLI" "$URGENT_GRUVBOXLI" "$ST_BG_GRUVBOXLI" "$ST_FG_GRUVBOXLI" "$ST_THEME_GRUVBOXLI"
    MODE="Gruvbox Light"
elif grep -wq "background $BG_GRUVBOXLI" "$CONFIG"; then
    apply_theme "$BG_TOKYO" "$SL_TOKYO" "$SP_TOKYO" "$WF_TOKYO" "$WI_TOKYO" "$URGENT_DEFAULT" "$ST_BG_TOKYO" "$ST_FG_TOKYO" "$DEFAULT_ST_THEME"
    MODE="Tokyo Night"
elif grep -wq "background $BG_TOKYO" "$CONFIG"; then
    apply_theme "$BG_SOLDARK" "$SL_SOLDARK" "$SP_SOLDARK" "$WF_SOLDARK" "$WI_SOLDARK" "$URGENT_DEFAULT" "$ST_BG_SOLDARK" "$ST_FG_SOLDARK" "$ST_THEME_SOLDARK"
    MODE="Solarized Dark"
elif grep -wq "background $BG_SOLDARK" "$CONFIG"; then
    apply_theme "$BG_ROSE" "$SL_ROSE" "$SP_ROSE" "$WF_ROSE" "$WI_ROSE" "$URGENT_DEFAULT" "$ST_BG_ROSE" "$ST_FG_ROSE" "$DEFAULT_ST_THEME"
    MODE="Rosé Pine"
elif grep -wq "background $BG_ROSE" "$CONFIG"; then
    apply_theme "$BG_DRACULA" "$SL_DRACULA" "$SP_DRACULA" "$WF_DRACULA" "$WI_DRACULA" "$URGENT_DEFAULT" "$ST_BG_DRACULA" "$ST_FG_DRACULA" "$DEFAULT_ST_THEME"
    MODE="Dracula"
elif grep -wq "background $BG_DRACULA" "$CONFIG"; then
    apply_theme "$BG_ANDREW" "$SL_ANDREW" "$SP_ANDREW" "$WF_ANDREW" "$WI_ANDREW" "$URGENT_DEFAULT" "$ST_BG_ANDREW" "$ST_FG_ANDREW" "$DEFAULT_ST_THEME"
    MODE="Andrew"
else
    apply_theme "$BG_ORIGINAL" "$SL_ORIGINAL" "$SP_ORIGINAL" "$WF_ORIGINAL" "$WI_ORIGINAL" "$URGENT_DEFAULT" "$ST_BG_ORIGINAL" "$ST_FG_ORIGINAL" "$DEFAULT_ST_THEME"
    MODE="Original (Reset)"
fi

# Aplicar y Notificar
$RELOAD_CMD
notify-send "${ENV} Bar" "Modo: $MODE" -a "System" -t 1000
