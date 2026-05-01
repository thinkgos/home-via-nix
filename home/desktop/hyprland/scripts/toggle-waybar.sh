#!/bin/bash

if pgrep -f waybar >/dev/null; then
    pkill -SIGUSR1 -f waybar
fi
