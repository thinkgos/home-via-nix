#!/bin/bash

if hyprctl clients -j | jq -e ".[] | select(.class == \"dropdown-terminal\")" >/dev/null; then
    hyprctl dispatch "hl.dsp.workspace.toggle_special('dropdown-terminal')"
else
    kitty --class dropdown-terminal -o tab_bar_edge=bottom --title "quake"
fi
