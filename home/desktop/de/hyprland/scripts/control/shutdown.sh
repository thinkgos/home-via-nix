#!/bin/bash

mode="$1"
case "$mode" in
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
esac

exit 0
