#!/bin/bash

echo "安装sddm桌面登录..."

#* ubuntu 26.04没有xorg xserver-xorg, 导致sddm起不来. 补一下.

sudo apt install xorg xserver-xorg
sudo apt install -y --no-install-recommends sddm sddm-theme-breeze
