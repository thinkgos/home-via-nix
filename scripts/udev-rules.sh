# moonlight/sunshine的键盘/鼠标才能工作
echo "配置sunshine udev规则(注意: 重启后生效)..."

sudo tee /etc/udev/rules.d/85-sunshine.rules <<EOF
KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
EOF

# 配置swayosd的udev规则
sudo tee /etc/udev/rules.d/99-swayosd.rules <<EOF
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
EOF
