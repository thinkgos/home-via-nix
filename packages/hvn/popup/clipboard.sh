#!/bin/bash

# 仅本地测试使用
# source "$(cd "$(dirname "${BASH_SOURCE[0]}")/../../ohlib/shell" && pwd)/log4sh.sh"

usage() {
    echo "Usage: $0 [-m|--mode mode] [-l|--log-level level] [-h|--help]"
    echo ""
    echo "  -m, --mode <mode>         模式 (history-overview|history-wipe), 默认: 无"
    echo "  -l, --log-level <level>   日志级别 (DEBUG|INFO|WARN|ERROR|FATAL|0-4), 默认: WARN"
    echo "  -h, --help                显示帮助"
    exit 1
}

MODE=""

PARSED=$(getopt -o l:m:h --long log-level:,mode:,help -n "$0" -- "$@")
if [ $? -ne 0 ]; then
    usage
fi
eval set -- "$PARSED"
while true; do
    case "$1" in
    -l | --log-level)
        log::set_level "$2"
        shift 2
        ;;
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

[ -z "$MODE" ] && usage

log::debug "模式: $MODE"

case "$MODE" in
history-overview)
    SELECTED=$(cliphist list | fuzzel --dmenu --anchor top-right --x-margin=220 --y-margin=0 --width 60 --mesg "📋 剪贴板" --config ~/.config/fuzzel/fuzzel.ini)
    if [ -z "$SELECTED" ]; then
        log::debug "用户取消选择"
        exit 0
    fi
    log::debug "用户选择: $SELECTED"
    echo "$SELECTED" | cliphist decode | wl-copy
    ;;
history-wipe)
    cliphist wipe
    ;;
*)
    log::error "未知模式: $MODE"
    usage
    ;;
esac

exit 0
