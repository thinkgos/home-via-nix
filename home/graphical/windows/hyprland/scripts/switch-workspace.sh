#!/bin/bash

mode="$1"

lastWorkspaceId=$(hyprctl workspaces -j | jq 'max_by(.id).id')
activeMonitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
lastWorkspaceIdOnActiveMonitor=$(hyprctl workspaces -j | jq --arg monitor "$activeMonitor" '[.[] | select(.monitor == $monitor)] | max_by(.id).id')

case "$mode" in
workspace)
    hyprctl dispatch workspace $lastWorkspaceId
    ;;
movetoworkspace)
    hyprctl dispatch movetoworkspace $lastWorkspaceId
    ;;
split-workspace)
    hyprctl dispatch workspace $lastWorkspaceIdOnActiveMonitor
    ;;
split-movetoworkspace)
    hyprctl dispatch movetoworkspace $lastWorkspaceIdOnActiveMonitor
    ;;
esac

exit 0
