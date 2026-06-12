#!/usr/bin/env bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")/scripts/lib/" && pwd)/log4sh.sh

#* ubuntu server 安装wayland

usage() {
    echo "Usage: $0 [-s|--session session] [-h|--help]"
    echo ""
    echo "  -s, --session <session> 可选: hyprland|niri"
    echo "  -h, --help          显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 -s niri"
    echo "  $0 --session hyprland"
    exit 1
}

SESSION=""

PARSED=$(getopt -o s:h --long session:,help -n "$0" -- "$@")
if [ $? -ne 0 ]; then
    usage
fi
eval set -- "$PARSED"
while true; do
    case "$1" in
    -s | --session)
        SESSION="$2"
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

if [ -z "$SESSION" ]; then
    log::error "请指定wayland会话模式"
    usage
    exit 1
fi

source ./scripts/packages.sh
source ./scripts/wayland-session.sh -s $SESSION
source ./scripts/general-settings.sh
source ./scripts/udev-rules.sh
source ./scripts/cleanup.sh
