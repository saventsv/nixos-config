#!/usr/bin/env bash

choice=$(printf "Shutdown\nReboot\nLogout" | dmenu -i -p "Power Menu")

case "$choice" in
  "Shutdown")
    systemctl poweroff
    ;;
  "Reboot")
    reboot
    ;;
  "Logout")
    # loginctl terminate-session "$(id -un)"
    # pkill -KILL -u "$USER" 
    dwm-msg run_command quit
    openbox --exit
    ;;
  *)
    exit 0
esac
