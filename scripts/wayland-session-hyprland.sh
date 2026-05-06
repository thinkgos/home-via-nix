#!/bin/bash

SESSION_FILE="/usr/share/wayland-sessions/hyprland.desktop"

echo "安装Hyprland会话..."

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
