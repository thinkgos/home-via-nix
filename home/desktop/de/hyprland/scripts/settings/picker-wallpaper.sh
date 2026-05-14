#!/bin/bash

# 壁纸选择器

WALLPAPER_DIR="${1:-$HOME/.local/share/wallpapers}"
TRANSITION="random"
FPS=60
STEP=20

# 路径列表存入数组
mapfile -t PATHS < <(find -L "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.avif" \))

# 构建传给 rofi 的显示内容(显示文件名，携带图标)
INDEX=$(
    for p in "${PATHS[@]}"; do
        echo -en "$(basename "$p")\0icon\x1f$p\n"
    done |
        rofi -dmenu -format i -config "~/.config/rofi/config-wallpaper.rasi"
)

# 没选则退出
[ -z "$INDEX" ] && exit 0

# 根据索引获取完整路径
FULL_PATH="${PATHS[$INDEX]}"
# 设置壁纸
awww img \
    --transition-type "$TRANSITION" \
    --transition-fps "$FPS" \
    --transition-step "$STEP" \
    $FULL_PATH
