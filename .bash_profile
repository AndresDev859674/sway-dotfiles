if [[ "$XDG_CURRENT_DESKTOP" =~ "sway:wlroots:swayfx" ]]; then
  export QT_QPA_PLATFORMTHEME=qt6ct
  export QT_QPA_PLATFORM=wayland
  export QT_QPA_PLATFORMTHEME=qt5ct
fi
