#!/usr/bin/env bash

choice=$(printf "Shutdown\nReboot\nLogout" | rofi -dmenu -i -p "Power Menu")

case "$choice" in
  "Shutdown")
    systemctl poweroff
    ;;
  "Reboot")
    reboot
    ;;
  "Logout")
    pkill -KILL -u "$USER" 
    ;;
  *)
    exit 0
esac
