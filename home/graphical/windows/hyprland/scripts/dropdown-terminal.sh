#!/bin/bash

hyprctl clients -j |
    jq -e ".[] | select(.class == \"dropdown-terminal\")" >/dev/null &&
    hyprctl dispatch togglespecialworkspace dropdown-terminal ||
    kitty --class dropdown-terminal -o tab_bar_edge=bottom --title "quake"
