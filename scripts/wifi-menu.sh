#!/bin/bash

# Get current status
WIFI_STATE=$(nmcli radio wifi)
ACTIVE_CONN=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

# Create menu options
OPTIONS=()

if [ "$WIFI_STATE" = "enabled" ]; then
    OPTIONS+=("Disable WiFi")
else
    OPTIONS+=("Enable WiFi")
fi

if [ -n "$ACTIVE_CONN" ]; then
    OPTIONS+=("Disconnect from $ACTIVE_CONN")
fi

OPTIONS+=("Scan & Connect")

# Let user choose
CHOICE=$(printf '%s\n' "${OPTIONS[@]}" | wofi --dmenu --prompt "WiFi Options")

case "$CHOICE" in
    "Enable WiFi")
        nmcli radio wifi on
        ;;
    "Disable WiFi")
        nmcli radio wifi off
        ;;
    "Disconnect from $ACTIVE_CONN")
        nmcli connection down "$ACTIVE_CONN"
        ;;
    "Scan & Connect")
        SSID=$(nmcli -f SSID,SIGNAL dev wifi list | awk 'NR>1 {print $1 " (" $2 "%)"}' | wofi --dmenu --prompt "Select Network" | cut -d' ' -f1)
        [ -z "$SSID" ] && exit
        nmcli connection show "$SSID" &> /dev/null
        if [ $? -eq 0 ]; then
            nmcli connection up "$SSID"
        else
            PASS=$(wofi --dmenu --password --prompt "Password for $SSID")
            [ -z "$PASS" ] && exit
            nmcli dev wifi connect "$SSID" password "$PASS"
        fi
        ;;
esac
