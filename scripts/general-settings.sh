#!/bin/bash

echo "设置中文语言(注意: 重启后生效)..."
sudo locale-gen zh_CN.UTF-8
sudo update-locale LANG=zh_CN.UTF-8

echo "设置时区..."
sudo timedatectl set-timezone Asia/Shanghai

# moonlight/sunshine的键盘/鼠标才能工作
echo "配置sunshine udev规则(注意: 重启后生效)..."
echo 'KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"' | sudo tee "/etc/udev/rules.d/85-sunshine.rules" >/dev/null

echo "配置brightnessctl(自带udev规则)/sunshine权限(注意: 重启后生效))..."
sudo usermod -aG video $USER
sudo usermod -aG input $USER
sudo usermod -aG render $USER

echo "配置hyprlock的pam配置..."
cat >/etc/pam.d/hyprlock <<EOF
#%PAM-1.0
auth    required        pam_unix.so
@include common-account
@include common-session
EOF
