#!/bin/bash

# Get volume and mute status for the default sink
output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

# Extract volume and mute flag
vol=$(echo "$output" | grep -oP 'Volume: \K[0-9.]+' | awk '{printf "%.0f", $1 * 100}')
mute=$(echo "$output" | grep -o '\[MUTED\]')

# Determine icon and message
if [[ -n "$mute" ]]; then
    icon="audio-volume-muted"
    msg="Muted"
    vol_level=0
else
    vol_level=$vol
    if (( vol_level < 30 )); then
        icon="audio-volume-low"
    elif (( vol_level < 70 )); then
        icon="audio-volume-medium"
    else
        icon="audio-volume-high"
    fi
    msg="Volume: ${vol_level}%"
fi

# Send or update notification using dunstify
dunstify -a "Volume" -r 91190 -u low -i "$icon" -h int:value:"$vol_level" "$msg"
