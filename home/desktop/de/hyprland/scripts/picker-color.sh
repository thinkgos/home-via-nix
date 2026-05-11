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

FX_HUE="Rr=r;Gg=g;Bb=b;\
Cmax=max(Rr,max(Gg,Bb));Cmin=min(Rr,min(Gg,Bb));Delta=Cmax-Cmin;\
IsR=(Cmax==Rr)*(Delta>1e-9);\
IsG=(Cmax==Gg)*(Delta>1e-9)*(Cmax!=Rr);\
IsB=(Delta>1e-9)*(Cmax!=Rr)*(Cmax!=Gg);\
Hr=IsR*((Gg-Bb)/Delta/6+(Gg<Bb));\
Hg=IsG*((Bb-Rr)/Delta/6+1/3);\
Hb=IsB*((Rr-Gg)/Delta/6+2/3);\
Hraw=Hr+Hg+Hb;Hf=Hraw-floor(Hraw);round(Hf*360)"

FX_S_HSL="Rr=r;Gg=g;Bb=b;\
Cmax=max(Rr,max(Gg,Bb));Cmin=min(Rr,min(Gg,Bb));Delta=Cmax-Cmin;\
Ll=(Cmax+Cmin)/2;\
Ss=(Delta<1e-9)?0:Delta/(1-abs(2*Ll-1));round(Ss*1000)/10"

FX_L="Rr=r;Gg=g;Bb=b;\
Cmax=max(Rr,max(Gg,Bb));Cmin=min(Rr,min(Gg,Bb));\
Ll=(Cmax+Cmin)/2;round(Ll*100)"

FX_S_HSV="Rr=r;Gg=g;Bb=b;\
Cmax=max(Rr,max(Gg,Bb));Cmin=min(Rr,min(Gg,Bb));Delta=Cmax-Cmin;\
Ss=(Cmax<1e-9)?0:Delta/Cmax;round(Ss*100)"

FX_V="Rr=r;Gg=g;Bb=b;Cmax=max(Rr,max(Gg,Bb));round(Cmax*1000)/10"
# -> HSL
read H_HSL S_HSL L_HSL <<<$(magick xc:"$HEX" -colorspace sRGB -format "%[fx:${FX_HUE}] %[fx:${FX_S_HSL}] %[fx:${FX_L}]" info:)
S_HSL=$(printf "%.1f" "$S_HSL")
L_HSL=$(printf "%.1f" "$L_HSL")
HSL="hsl(${H_HSL}, ${S_HSL}%, ${L_HSL}%)"

# -> HSV
read H_HSV S_HSV V_HSV <<<$(magick xc:"$HEX" -colorspace sRGB -format "%[fx:${FX_HUE}] %[fx:${FX_S_HSV}] %[fx:${FX_V}]" info:)
S_HSV=$(printf "%.1f" "$S_HSV")
V_HSV=$(printf "%.1f" "$V_HSV")
HSV="hsv(${H_HSV}, ${S_HSV}%, ${V_HSV}%)"

# wofi菜单
OPTIONS="HEX: $HEX\nRGB: $RGB\nHSL: $HSL\nHSV: $HSV"
CHOICE=$(echo -e "$OPTIONS" | wofi --dmenu -i -p "Pick Color Format:" -mesg "Selected: $HEX")

# 处理选择并复制到剪贴板
if [ -n "$CHOICE" ]; then
    VALUE=$(echo "$CHOICE" | cut -d':' -f2- | xargs)
    echo -n "$VALUE" | wl-copy
    notify-send "Color Copied" "$VALUE" -i color-picker
fi
