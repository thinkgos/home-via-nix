#!/usr/bin/env bash

#* ubuntu server 安装wayland

#* ubuntu 26.04没有xorg xserver-xorg, 导致sddm起不来. 补一下.
# sudo apt install xorg xserver-xorg

source ./scripts/required-system.sh
source ./scripts/wayland-session-hyprland.sh
source ./scripts/general-settings.sh
source ./scripts/cleanup-unnecessary.sh
