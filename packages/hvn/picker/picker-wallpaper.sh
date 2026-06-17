#!/bin/bash

# 壁纸选择器

# 仅本地测试使用
# source "$(cd "$(dirname "${BASH_SOURCE[0]}")/../../ohlib/shell" && pwd)/log4sh.sh"

usage() {
    echo "Usage: $0 [options] [wallpaper_dir]"
    echo ""
    echo "  wallpaper_dir    壁纸目录, 默认: ~/.local/share/wallpapers"
    echo ""
    echo "Options:"
    echo "  -m, --mode <type>         选择器模式, 默认: normal"
    echo "  -t, --transition <type>   awww过渡类型, 默认: random"
    echo "  -f, --fps <num>           awww过渡帧率, 默认: 60"
    echo "  -s, --step <num>          awww过渡步数, 默认: 20"
    echo "  -l, --log-level <level>   日志级别 (DEBUG|INFO|WARN|ERROR|FATAL|0-4), 默认: WARN"
    echo "  -h, --help                显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 ~/.local/share/wallpapers"
    echo "  $0 -m rofi -t fade -f 30 ~/pictures/wallpapers"
    exit 1
}

WALLPAPER_DIR="$HOME/.local/share/wallpapers"
MODE="normal"
TRANSITION="random"
FPS=60
STEP=20

PARSED=$(getopt -o m:t:f:s:l:h --long mode:,transition:,fps:,step:,log-level:,help -n "$0" -- "$@")
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
    -t | --transition)
        TRANSITION="$2"
        shift 2
        ;;
    -f | --fps)
        FPS="$2"
        shift 2
        ;;
    -s | --step)
        STEP="$2"
        shift 2
        ;;
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
        log::error "未知选项: $1"
        usage
        ;;
    esac
done

# 如果有位置参数，覆盖壁纸目录
[ -n "${1:-}" ] && WALLPAPER_DIR="$1"

log::debug "模式: $MODE, 壁纸目录: $WALLPAPER_DIR"
log::debug "过渡类型: $TRANSITION, 帧率: $FPS, 步数: $STEP"

# 路径列表存入数组
mapfile -t PATHS < <(find -L "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.avif" \))

[ ${#PATHS[@]} -eq 0 ] && log::error "未找到图片文件: $WALLPAPER_DIR" && exit 1

log::debug "找到 ${#PATHS[@]} 张图片"

FULL_PATH=""

case "$MODE" in
side)
    # 构建传给 picker 的显示内容(显示文件名，携带图标)
    INDEX=$(
        for p in "${PATHS[@]}"; do
            echo -en "$(basename "$p")\0icon\x1f$p\n"
        done |
            rofi -dmenu -format i -config "$HOME/.config/rofi/config-wallpaper.rasi"
    )
    # 没选则退出
    [ -z "$INDEX" ] && log::debug "用户取消选择" && exit 0
    # 根据索引获取完整路径
    FULL_PATH="${PATHS[$INDEX]}"
    ;;
normal)
    FULL_PATH=$(printf '%s\n' "${PATHS[@]}" | vicinae dmenu -p 'Pick a wallpaper...' -W 980 -H 600 --no-footer)
    ;;
*)
    log::error "未知模式: $MODE"
    exit 1
    ;;
esac

[ -z "$FULL_PATH" ] && log::debug "用户未选择壁纸" && exit 0

log::debug "设置壁纸: "$FULL_PATH""

# 设置壁纸
awww img \
    --transition-type "$TRANSITION" \
    --transition-fps "$FPS" \
    --transition-step "$STEP" \
    "$FULL_PATH"

log::debug "壁纸设置完成"
