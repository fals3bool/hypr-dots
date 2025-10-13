#!/usr/bin/env bash

# Ajustado a 1366x768
A_base=284
B_base=284

if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Resolución del monitor
height=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height')
scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')
resolution=$(awk "BEGIN {printf \"%.0f\", $height / $scale}") # altura ajustada

wlogout -C "$HOME/.config/wlogout/style.css" \
        -l "$HOME/.config/wlogout/layout" \
        --protocol layer-shell -b 4 \
        -T $(awk "BEGIN {printf \"%.0f\", $A_base * $resolution * $scale / $resolution}") \
        -B $(awk "BEGIN {printf \"%.0f\", $B_base * $resolution * $scale / $resolution}") &

