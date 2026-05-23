#!/bin/bash

usage() {
    echo "Usage: $0 [-m|--mode mode] [-h|--help]"
    echo ""
    echo "  -m, --mode <mode>   模式(logout|reboot|poweroff|suspend|hibernate)"
    echo "  -h, --help          显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 -m logout"
    echo "  $0 --mode reboot"
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
        usage
        ;;
    esac
done

if [ -z "$MODE" ]; then
    usage
fi

case "$MODE" in
logout)
    zenity --question --text="确定要登出 $USER 吗？" &&
        hyprshutdown -t "注销中..."
    # zenity --question --text="确定要登出 $USER 吗？" && hyprshutdown -t "注销中..." --post-cmd "loginctl terminate-user $USER"
    ;;
reboot)
    zenity --question --text="确定要重启吗？" &&
        hyprshutdown -t "重启中..." --post-cmd "/bin/systemctl reboot"
    ;;
poweroff)
    zenity --question --text="确定要关机吗？" &&
        hyprshutdown -t "关机中..." --post-cmd "/bin/systemctl poweroff"
    ;;
suspend)
    zenity --question --text="确定要挂起吗？" &&
        /bin/systemctl suspend
    ;;
hibernate)
    zenity --question --text="确定要休眠吗？" &&
        /bin/systemctl hibernate
    ;;
*)
    echo "不支持的模式: $MODE"
    usage
    ;;
esac

exit 0
