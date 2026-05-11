#!/bin/bash

screenshotDir=$HOME/Pictures/screenshots
mkdir -p "${screenshotDir}"

mode="$1"
file="${screenshotDir}/$(date +'%Y%m%d%H%M%S').png"

do_error() {
    notify-send "$1取消" "操作已取消或发生错误" -i dialog-information
    exit 1
}

do_success() {
    notify-send "已获取$1" "你可以从剪贴板粘贴$1" -i camera-photo
}

do_screenshot_success() {
    wl-copy -t image/png <"$file"
    do_success $1
}

case "$mode" in
window)
    # 窗口截图
    hyprctl -j activewindow |
        jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' |
        grim -g - "$file" || do_error "截图"
    do_screenshot_success "截图"
    ;;
fullscreen)
    # 全屏截图
    grim "$file" || do_error "截图"
    do_screenshot_success "截图"
    ;;
region)
    # 选框截图
    region=$(slurp -w 1 -c '#ff0000ff') || do_error "截图"
    grim -g "$region" "$file" || do_error "截图"
    do_screenshot_success "截图"
    ;;
window-annotate)
    # 窗口截图标注
    hyprctl -j activewindow |
        jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' |
        grim -g - - |
        satty --filename - --output-filename "$file" || do_error "截图"
    ;;
fullscreen-annotate)
    # 全屏截图标注
    grim - |
        satty --filename - --output-filename "$file" || do_error "截图"
    ;;
region-annotate)
    # 选框截图标注
    region=$(slurp -w 1 -c '#ff0000ff') || do_error "截图"
    grim -g "$region" - |
        satty --filename - --output-filename "$file" || do_error "截图"
    ;;
pixel-measure)
    # 像素测量
    slurp -d | awk '{print $2}' | wl-copy || do_error "像素测量"
    do_success "像素测量"
    ;;
ocr)
    # ocr识别
    region=$(slurp -w 1 -c '#ff0000ff') || do_error "截图"
    grim -g "$region" - |
        tesseract - stdout -l chi_sim+eng | wl-copy || do_error "ocr识别"
    do_success "ocr识别"
    ;;
esac

exit 0
