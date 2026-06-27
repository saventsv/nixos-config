#!/usr/bin/env bash


choice=$(printf "Turn Wi-Fi On\nTurn Wi-Fi Off\nScan & Connect\nCurrent Connection\nQuit" | rofi -dmenu -i -p "WiFi")

case "$choice" in
  "Turn Wi-Fi On")
    nmcli radio wifi on
    ;;
  "Turn Wi-Fi Off")
    nmcli radio wifi off
    ;;
  "Scan & Connect")
    ssid=$(nmcli -t -f SSID dev wifi list | sort -u | dmenu -i -p "Select WiFi")
    [ -z "$ssid" ] && exit 0

    password=$(echo "" | rofi -dmenu -p "Password for $ssid (leave empty if open)")

    if [ -z "$password" ]; then
      nmcli dev wifi connect "$ssid"
    else
      nmcli dev wifi connect "$ssid" password "$password"
    fi
    ;;
  "Current Connection")
    nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2 | rofi -dmenu -i
    ;;
  *)
    exit 0
    ;;
esac
