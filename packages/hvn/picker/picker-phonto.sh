#!/bin/bash

# 视频壁纸选择器

# 仅本地测试使用
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/../../ohlib/shell" && pwd)/log4sh.sh"

usage() {
    echo "Usage: $0 [options] [wallpaper_dir]"
    echo ""
    echo "  wallpaper_dir    视频壁纸目录, 默认: ~/Videos/phonto"
    echo ""
    echo "Options:"
    echo "  -m, --mode <type>         选择器模式, 默认: normal"
    echo "  -l, --log-level <level>   日志级别 (DEBUG|INFO|WARN|ERROR|FATAL|0-4), 默认: WARN"
    echo "  -h, --help                显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 ~/Videos/phonto"
    exit 1
}

WALLPAPER_DIR="$HOME/Videos/phonto"
MODE="normal"

PARSED=$(getopt -o m:l:h --long mode:,log-level:,help -n "$0" -- "$@")
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

# 如果有位置参数，覆盖视频壁纸目录
[ -n "${1:-}" ] && WALLPAPER_DIR="$1"

log::debug "模式: $MODE, 视频壁纸目录: $WALLPAPER_DIR"

# 路径列表存入数组
mapfile -t PATHS < <(find -L "$WALLPAPER_DIR" -type f \( -iname "*.mp4" \))

[ ${#PATHS[@]} -eq 0 ] && log::error "未找到图片文件: $WALLPAPER_DIR" && exit 1

log::debug "找到 ${#PATHS[@]} 个视频"

FULL_PATH=$(printf '%s\n' "${PATHS[@]}" | vicinae dmenu -p 'Pick a video...' -W 980 -H 600 --no-footer)

[ -z "$FULL_PATH" ] && log::debug "用户未选择视频" && exit 0

log::debug "设置视频壁纸: "$FULL_PATH""

/bin/pkill -x phonto
# # 设置视频壁纸
phonto "$FULL_PATH" 2>/tmp/phonto.log &

log::debug "视频壁纸设置完成"
