#!/bin/bash

if niri msg -j windows | jq -e ".[] | select(.app_id == \"dropdown-terminal\")" >/dev/null; then
    niri msg action focus-window-or-workspace-with-urgency
else
    kitty --class dropdown-terminal -o tab_bar_edge=bottom --title "quake"
fi
