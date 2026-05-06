#!/bin/bash

echo "安装必需的系统软件..."
sudo apt install -y \
    pipewire pipewire-pulse pipewire-alsa wireplumber pipewire-audio-client-libraries libspa-0.2-bluetooth \
    brightnessctl bluez bluez-tools bluez-cups playerctl \
    qt6-wayland \
    fonts-noto-core fonts-noto-cjk \
    gvfs \
    network-manager \
    libnotify-bin \
    thermald \
    power-profiles-daemon \
    gnome-keyring \
    language-pack-zh-hans
