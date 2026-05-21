# moonlight/sunshine的键盘/鼠标才能工作
echo "配置sunshine udev规则(注意: 重启后生效)..."

sudo tee /etc/udev/rules.d/85-sunshine.rules >/dev/null <<EOF
KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
EOF
