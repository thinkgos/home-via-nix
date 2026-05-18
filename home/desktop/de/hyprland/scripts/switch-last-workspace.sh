#!/bin/bash

#* 仅限本地测试使用
# source $(cd "$(dirname "${BASH_SOURCE[0]}")/../../../../lib/" && pwd)/log4sh.sh

usage() {
    echo "Usage: $0 [-m|--mode mode] [-h|--help]"
    echo ""
    echo "  -m, --mode <mode>   模式(workspace|window-move-workspace|split-workspace|split-window-move-workspace)"
    echo "  -h, --help          显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 -m split-workspace"
    echo "  $0 --mode split-workspace"
    exit 1
}

MODE=""

PARSED=$(getopt -o m:h --long mode:,help -n "$0" -- "$@")
if [ $? -ne 0 ]; then
    usage
fi
eval set -- "$PARSED"
while true; do
    case "$1" in
    -m | --mode)
        MODE="$2"
        shift 2
        ;;
    -h | --help)
        usage
        ;;
    --)
        shift
        break
        ;;
    *)
        log::error "未知参数 $1"
        usage
        ;;
    esac
done

lastWorkspaceId=$(hyprctl workspaces -j | jq 'max_by(.id).id')
activeMonitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')
lastWorkspaceIdOnActiveMonitor=$(hyprctl workspaces -j | jq --arg monitor "$activeMonitor" '[.[] | select(.monitor == $monitor)] | max_by(.id).id')

case "$MODE" in
workspace)
    hyprctl dispatch "hl.dsp.focus({ workspace = $lastWorkspaceId })"
    ;;
window-move-workspace)
    hyprctl dispatch "hl.dsp.window.move({ workspace = $lastWorkspaceId })"
    ;;
split-workspace)
    hyprctl dispatch "hl.dsp.focus({ workspace = $lastWorkspaceIdOnActiveMonitor })"
    ;;
split-window-move-workspace)
    hyprctl dispatch "hl.dsp.window.move({ workspace = $lastWorkspaceIdOnActiveMonitor })"
    ;;
*)
    log::error "不支持的模式 -$MODE"
    usage
    ;;
esac

exit 0
