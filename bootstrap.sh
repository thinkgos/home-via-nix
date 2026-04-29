#!/usr/bin/env bash

#* ubuntu server 安装wayland

#* ubuntu 26.04没有xorg xserver-xorg, 导致sddm起不来. 补一下.
# sudo apt install xorg xserver-xorg

source ./scripts/required_sys_software.sh
source ./scripts/wayland_session.sh

echo "设置中文语言(注意: 重启后生效)..."
sudo locale-gen zh_CN.UTF-8
sudo update-locale LANG=zh_CN.UTF-8

echo "设置时区..."
sudo timedatectl set-timezone Asia/Shanghai

echo "配置brightnessctl(自带udev规则)权限(注意: 重启后生效))..."
sudo usermod -aG video $USER
sudo usermod -aG input $USER

echo "清理不需要的软件..."
sudo apt remove -y needrestart
