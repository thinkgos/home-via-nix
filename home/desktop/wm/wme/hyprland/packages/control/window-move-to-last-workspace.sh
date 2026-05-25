#!/bin/bash

#* 仅限本地测试使用
# source "$(cd "$(dirname "${BASH_SOURCE[0]}")/../../../../../../packages/ohlib/shell" && pwd)/log4sh.sh"

curActiveMonitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
lastWorkspaceId=$(hyprctl workspaces -j | jq --arg monitor "$curActiveMonitor" '[.[] | select(.monitor == $monitor)] | max_by(.id).id')

hyprctl dispatch "hl.dsp.window.move({ workspace = $lastWorkspaceId })"
