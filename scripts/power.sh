#!/bin/bash

# Power menu options
entries="󰐥 Poweroff\n󰜉 Reboot\n󰤄 Suspend\n󰍃 Logout\n Lock"

selected=$(echo -e "$entries" | wofi --show dmenu --prompt "Power Menu" --width 30% --height 40% --location=center)

# Fade-out transition
swww clear

case $selected in
  *Poweroff) systemctl poweroff ;;
  *Reboot) systemctl reboot ;;
  *Suspend) systemctl suspend ;;
  *Logout) hyprctl dispatch exit ;;
  *Lock) loginctl lock-session ;;
  *) exit 1 ;;
esac

