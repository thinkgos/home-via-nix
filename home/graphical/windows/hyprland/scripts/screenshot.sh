#!/usr/bin/env bash

screenshotDir=$HOME/Pictures/screenshots
mkdir -p "${screenshotDir}"

mode="$1"
file="${screenshotDir}/$(date +'%Y%m%d%H%M%S').png"
case "$mode" in
active)
    hyprctl -j activewindow \
    | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' \
    | grim -g - "$file"
    ;;
full)
    grim "$file"
    ;;
region)
    grim -g "$(slurp)" "$file"
    ;;
annotate)
    grim -g "$(slurp)" - | satty --filename -
    return
    ;;
esac

notify-send "已获取截图" "你可以从剪贴板粘贴截图" -i camera-photo
wl-copy -t image/png < "$file"