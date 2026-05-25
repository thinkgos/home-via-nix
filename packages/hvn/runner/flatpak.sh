#!/bin/bash

# 仅本地测试使用
# source "$(cd "$(dirname "${BASH_SOURCE[0]}")/../../ohlib/shell" && pwd)/log4sh.sh"

usage() {
    echo "Usage: $0 [-l|--log-level level] [-h|--help] <program>"
    echo ""
    echo "  -l, --log-level <level>   日志级别 (DEBUG|INFO|WARN|ERROR|FATAL|0-4), 默认: WARN"
    echo "  -h, --help                显示帮助"
    exit 1
}

PROGRAM=""

PARSED=$(getopt -o l:h --long log-level:,help -n "$0" -- "$@")
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
    -h | --help)
        usage
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "未知参数 $1"
        usage
        ;;
    esac
done

PROGRAM="$1"
[ -z "$PROGRAM" ] && usage

/bin/systemd-run --user /bin/flatpak run "$PROGRAM"
