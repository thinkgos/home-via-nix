#!/usr/bin/env bash

mode="$1"
case "$mode" in
logout)
    zenity --question --text="确定要登出 $USER 吗？" && hyprshutdown -t "注销中..."
    ;;
reboot)
    zenity --question --text="确定要重启吗？" && hyprshutdown -t "重启中..." --post-cmd "systemctl reboot"
    ;;
poweroff)
    zenity --question --text="确定要关机吗？" && hyprshutdown -t "关机中..." --post-cmd "systemctl poweroff"
    ;;
esac

exit 0
