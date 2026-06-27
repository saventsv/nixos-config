#!/usr/bin/env bash

choice=$(printf "Power On\nPower Off\nDevices\nScan On\nScan Off\nQuit" | rofi -dmenu -i -p "Bluetooth")

case "$choice" in
    "Power On")
        bluetoothctl power on
        ;;
    "Power Off")
        bluetoothctl power off
        ;;
    "Scan On")
        bluetoothctl scan on
        ;;
    "Scan Off")
        bluetoothctl scan off
        ;;
    "Devices")
        bluetoothctl devices | awk '{print $2 " " substr($0, index($0,$3))}' | rofi -dmenu -i -p "Select Device" | awk '{print $1}' | xargs -r bluetoothctl connect
        ;;
    *)
        exit 0
        ;;
esac
