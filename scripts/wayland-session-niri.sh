#!/bin/bash

SESSION_FILE="/usr/share/wayland-sessions/niri.desktop"

echo "安装niri会话..."

sudo mkdir -p $(dirname "$SESSION_FILE")
cat <<EOF | sudo tee "$SESSION_FILE" >/dev/null
[Desktop Entry]
Name=niri
Comment=A scrollable-tiling Wayland compositor managed by Home Manager
Exec=/home/$USER/.nix-profile/bin/niri-session
Type=Application
DesktopNames=niri
EOF

sudo chmod 644 "$SESSION_FILE"
