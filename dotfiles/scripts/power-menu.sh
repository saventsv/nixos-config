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
    pkill Xorg
    ;;
  *)
    exit 0
    ;;
esac
