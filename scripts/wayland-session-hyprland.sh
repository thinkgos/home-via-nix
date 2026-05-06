#!/bin/bash

SESSION_FILE="/usr/share/wayland-sessions/hyprland.desktop"

echo "安装sddm桌面登录..."

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
