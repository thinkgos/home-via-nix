#!/bin/bash

usage() {
    echo "Usage: $0 [-m|--mode mode] [-h|--help]"
    echo ""
    echo "  -m, --mode <mode>   模式(pixel-measure|ocr|window|fullscreen|region|window-annotate|fullscreen-annotate|region-annotate|scroll|scroll-preview)"
    echo "  -h, --help          显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 -m fullscreen"
    echo "  $0 --mode region"
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

screenshotDir=$HOME/Pictures/screenshots
file="${screenshotDir}/$(/bin/date +'%Y%m%d%H%M%S').png"

do_error() {
    /bin/notify-send "$1取消" "操作已取消或发生错误" -i dialog-information
    exit 1
}

do_success() {
    /bin/notify-send "已获取$1" "你可以从剪贴板粘贴$1" -i camera-photo
}

do_screenshot_success() {
    wl-copy -t image/png <"$file"
    do_success "$1"
}

wl-active-window() {
    hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"'
}

/bin/mkdir -p "${screenshotDir}"

case "$MODE" in
pixel-measure)
    # 像素测量
    slurp -d | /bin/awk '{print $2}' | wl-copy || do_error "像素测量"
    do_success "像素测量"
    ;;
ocr)
    # ocr识别
    region=$(slurp -w 1 -c '#ff0000ff') || do_error "截图"
    grim -g "$region" - |
        tesseract - stdout -l chi_sim+eng | wl-copy || do_error "ocr识别"
    do_success "ocr识别"
    ;;
window)
    # 窗口截图
    wl-active-window |
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
    wl-active-window |
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
scroll)
    # 滚动截图
    # BUG: 无预览窗口时, 无法停止!
    wayscrollshot --no-preview
    ;;
scroll-preview)
    # 滚动截图 - 带预览窗口
    wayscrollshot
    ;;
*)
    echo "不支持的模式: $MODE"
    usage
    ;;
esac

exit 0
