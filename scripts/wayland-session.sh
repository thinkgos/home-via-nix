#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")/lib/" && pwd)/log4sh.sh

usage() {
    echo "Usage: $0 [-s|--session session] [-h|--help]"
    echo ""
    echo "  -s, --session <session> 可选: hyprland|niri"
    echo "  -h, --help          显示帮助"
    echo ""
    echo "Example:"
    echo "  $0 -s niri"
    echo "  $0 --session hyprland"
    exit 1
}

SESSION=""

PARSED=$(getopt -o s:h --long session:,help -n "$0" -- "$@")
if [ $? -ne 0 ]; then
    usage
fi
eval set -- "$PARSED"
while true; do
    case "$1" in
    -s | --session)
        SESSION="$2"
        shift 2
        ;;
    -h | --help)
        usage
        ;;
    --)
        shift
        break
        ;;
    *)
        log::error "未知参数 $1"
        usage
        ;;
    esac
done

if [ -z "$SESSION" ]; then
    log::error "请指定wayland会话模式"
    usage
    exit 1
fi

log::info "安装sddm桌面登录..."

#* ubuntu 26.04没有xorg xserver-xorg, 导致sddm起不来. 补一下.

sudo apt install xorg xserver-xorg
sudo apt install -y --no-install-recommends sddm sddm-theme-breeze

case $SESSION in
niri)
    # 安装niri会话

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
    ;;
hyprland)
    # 安装hyprland会话
    SESSION_FILE="/usr/share/wayland-sessions/hyprland.desktop"

    echo "安装hyprland会话..."

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
    ;;
*)
    log::error "不支持的wayland会话模式: $SESSION"
    exit 1
    ;;
esac
