#!/bin/bash

hyprctl clients -j |
    jq -e ".[] | select(.class == \"dropdown-terminal\")" >/dev/null &&
    hyprctl dispatch "hl.dsp.workspace.toggle_special('dropdown-terminal')" ||
    kitty --class dropdown-terminal -o tab_bar_edge=bottom --title "quake"
