#!/usr/bin/env bash
# GAMMASTEP - blue light filter

if pgrep -x "gammastep" > /dev/null; then
    pkill -x "gammastep"
    exit 0
fi

gammastep -O 4900
