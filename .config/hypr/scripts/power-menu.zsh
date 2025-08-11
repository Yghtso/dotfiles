#!/bin/zsh

# A wofi-based System/Power Menu for Zsh

local -a menu_options
menu_options=(
    "  Power Off"
    "  Restart"
    "  Lock"
)

chosen=$(print -l $menu_options | wofi --dmenu --lines 3 --width 10% --prompt "Power Menu")

# Exit if nothing was chosen (e.g., user pressed Esc)
if [[ -z "$chosen" ]]; then
    exit 0
fi

case "$chosen" in
    "  Power Off")
        poweroff
        ;;
    "  Restart")
        reboot
        ;;
    "  Lock")
        hyprlock
        ;;
esac
