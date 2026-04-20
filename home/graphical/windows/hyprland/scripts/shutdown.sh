#!/usr/bin/env bash

mode="$1"
case "$mode" in
logout)
    zenity --question --text="确定要登出 $USER 吗？" && hyprshutdown -t "注销中..."
    ;;
reboot)
    zenity --question --text="确定要重启吗？" && hyprshutdown -t "重启中..." --post-cmd "reboot"
    ;;
shutdown)
    zenity --question --text="确定要关机吗？" && hyprshutdown -t "关机中..." --post-cmd "shutdown -P 0"
    ;;
esac

exit 0
