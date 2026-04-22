#!/usr/bin/env bash

screenshotDir=$HOME/Pictures/screenshots
mkdir -p "${screenshotDir}"

mode="$1"
file="${screenshotDir}/$(date +'%Y%m%d%H%M%S').png"

do_error() {
    notify-send "截图取消" "操作已取消或发生错误" -i dialog-information
    exit 1
}

case "$mode" in
active)
    hyprctl -j activewindow |
        jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' |
        grim -g - "$file" || do_error
    ;;
full)
    grim "$file" || do_error
    ;;
region)
    region=$(slurp -w 1 -c '#ff0000ff') || do_error
    grim -g "$region" "$file" || do_error
    ;;
annotate)
    region=$(slurp -w 1 -c '#ff0000ff') || do_error
    grim -g "$region" - | satty --filename - --output-filename "$file" || do_error
    exit 0
    ;;
esac

wl-copy -t image/png <"$file"
notify-send "已获取截图" "你可以从剪贴板粘贴截图" -i camera-photo
exit 0
