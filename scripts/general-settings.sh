#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")/lib/" && pwd)/log4sh.sh

log::info "设置中文语言(注意: 重启后生效)..."
sudo locale-gen zh_CN.UTF-8
sudo update-locale LANG=zh_CN.UTF-8

log::info "设置时区..."
sudo timedatectl set-timezone Asia/Shanghai

log::info "配置brightnessctl(自带udev规则)/sunshine权限(注意: 重启后生效))..."
sudo usermod -aG video $USER
sudo usermod -aG input $USER
sudo usermod -aG render $USER

log::info "配置hyprlock的pam配置..."
sudo tee /etc/pam.d/hyprlock >/dev/null <<EOF
#%PAM-1.0
auth      required      pam_unix.so
@include common-account
@include common-session
EOF
