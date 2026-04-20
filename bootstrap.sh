#!/usr/bin/env bash

#* ubuntu server 安装wayland
# sudo apt purge xdg-desktop-portal-kde xwaylandvideobridge

# 必装系统软件:
sudo apt install -y \
    pipewire pipewire-pulse pipewire-alsa wireplumber \
    brightnessctl bluez playerctl \
    qt6-wayland \
    fonts-noto-core fonts-noto-cjk \
    gvfs \
    network-manager \
    libnotify-bin \
    thermald \
    power-profiles-daemon \
    gnome-keyring

# sddm桌面登录
SESSION_FILE="/usr/share/wayland-sessions/hyprland.desktop"
sudo apt install --no-install-recommends sddm
sudo mkdir -p $(dirname "$SESSION_FILE")
cat <<EOF | sudo tee "$SESSION_FILE" >/dev/null
[Desktop Entry]
Name=Hyprland
Comment=Hyprland managed by Home Manager
Exec=/home/$USER/.nix-profile/bin/start-hyprland
Type=Application
DesktopNames=Hyprland
EOF
sudo chmod 644 "$SESSION_FILE"
