#!/bin/bash

# Get current and max brightness
current=$(brightnessctl g)
max=$(brightnessctl m)

# Validate values
if [[ -z "$current" || -z "$max" || "$max" -eq 0 ]]; then
    echo "Error: Could not get brightness values"
    exit 1
fi

# Compute percentage
percent=$(( 100 * current / max ))

# Choose icon based on brightness
if (( percent < 30 )); then
    icon="display-brightness-low"
elif (( percent < 70 )); then
    icon="display-brightness-medium"
else
    icon="display-brightness-high"
fi

# Send notification (replaceable)
dunstify -a "Brightness" -r 91191 -u low -i "$icon" -h int:value:"$percent" "Brightness: ${percent}%"
