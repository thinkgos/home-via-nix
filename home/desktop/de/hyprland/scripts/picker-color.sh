#!/bin/bash

# 1. 使用 hyprpicker 获取 HEX 颜色
HEX=$(hyprpicker -a -n -s 5 -u 60)

# 如果用户中途取消，则退出
if [ -z "$HEX" ]; then
    exit 1
fi

# ImageMagick 进行颜色空间转换
# -> RGB
RGB=$(magick xc:"$HEX" -format "rgb(%[fx:int(255*r)], %[fx:int(255*g)], %[fx:int(255*b)])" info:)
# -> HSL
# 格式(360, 100%, 100%)
HSL=$(magick xc:"$HEX" -colorspace HSL -format 'hsl(%[fx:int(p.hue*360)], %[fx:int(p.saturation*100)]%%, %[fx:int(p.lightness*100)]%%)' info:)
# -> HSV/HSB
HSV=$(magick xc:"$HEX" -colorspace HSV -format 'hsv(%[fx:int(p.hue*360)], %[fx:int(p.saturation*100)]%%, %[fx:int(p.lightness*100)]%%)' info:)

# wofi菜单
OPTIONS="HEX: $HEX\nRGB: $RGB\nHSL: $HSL\nHSV: $HSV"
CHOICE=$(echo -e "$OPTIONS" | wofi -dmenu -i -p "Pick Color Format:" -mesg "Selected: $HEX")

# 处理用户选择并将结果复制到剪贴板
if [ -n "$CHOICE" ]; then
    FINAL_VALUE=$(echo "$CHOICE" | cut -d':' -f2- | xargs)
    echo -n "$FINAL_VALUE" | wl-copy
    notify-send "Color Copied" "$FINAL_VALUE" -i color-picker
fi
