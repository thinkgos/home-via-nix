#!/bin/bash

echo "设置中文语言(注意: 重启后生效)..."
sudo locale-gen zh_CN.UTF-8
sudo update-locale LANG=zh_CN.UTF-8

echo "设置时区..."
sudo timedatectl set-timezone Asia/Shanghai

echo "配置brightnessctl(自带udev规则)权限(注意: 重启后生效))..."
sudo usermod -aG video $USER
sudo usermod -aG input $USER
sudo usermod -aG render $USER
