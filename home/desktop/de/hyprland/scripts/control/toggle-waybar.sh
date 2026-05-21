#!/bin/bash

if pgrep -f waybar >/dev/null; then
    /bin/pkill -SIGUSR1 -f waybar
fi
