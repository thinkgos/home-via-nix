#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")/lib/" && pwd)/log4sh.sh

log::info "安装必需的系统软件..."
sudo apt install -y \
	pipewire pipewire-pulse pipewire-alsa wireplumber pipewire-audio-client-libraries libspa-0.2-bluetooth libepoxy-dev \
	brightnessctl bluez bluez-tools bluez-cups playerctl \
	qt6-wayland \
	fonts-noto-core fonts-noto-cjk \
	gvfs \
	network-manager \
	libnotify-bin \
	thermald \
	power-profiles-daemon \
	gnome-keyring seahorse \
	language-pack-zh-hans

sudo apt install -y \
	gvfs-backends gvfs-fuse smbclient cifs-utils
