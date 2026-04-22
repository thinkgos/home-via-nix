#!/usr/bin/env bash

#* ubuntu server 安装wayland

echo "安装必需的系统软件..."
sudo apt install -y \
    pipewire pipewire-pulse pipewire-alsa wireplumber pipewire-audio-client-libraries libspa-0.2-bluetooth \
    brightnessctl bluez playerctl \
    qt6-wayland \
    fonts-noto-core fonts-noto-cjk \
    gvfs \
    network-manager \
    libnotify-bin \
    thermald \
    power-profiles-daemon \
    gnome-keyring \
    language-pack-zh-hans

echo "设置中文语言(注意: 重启后生效)..."
sudo locale-gen zh_CN.UTF-8
sudo update-locale LANG=zh_CN.UTF-8

echo "安装sddm桌面登录..."
SESSION_FILE="/usr/share/wayland-sessions/hyprland.desktop"
sudo apt install -y --no-install-recommends sddm sddm-theme-breeze
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

echo "配置网络启动等待时间..."
NETWORKD_WAIT_ONLINE_CONF="/etc/systemd/system/systemd-networkd-wait-online.service.d/override.conf"
sudo mkdir -p $(dirname "$NETWORKD_WAIT_ONLINE_CONF")
sudo tee "$NETWORKD_WAIT_ONLINE_CONF" >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any --timeout=10
EOF
sudo systemctl daemon-reload
echo "配置网络启动等待时间已生效！"
echo "当前网络启动等待时间配置内容："
systemctl cat "$NETWORKD_WAIT_ONLINE_CONF" | grep ExecStart

echo "设置时区..."
sudo timedatectl set-timezone Asia/Shanghai

echo "配置brightnessctl(自带udev规则)权限(注意: 重启后生效))..."
sudo usermod -aG video $USER
sudo usermod -aG input $USER

echo "清理不需要的软件..."
sudo apt remove -y needrestart
