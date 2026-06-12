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
ACCOUNT_USER=""

PARSED=$(getopt -o s:u:h --long session:user:,help -n "$0" -- "$@")
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
    -u | --user)
        ACCOUNT_USER="$2"
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

if [ -z "$SESSION" || -z "$ACCOUNT_USER" ]; then
    log::error "请指定wayland会话模式和用户"
    usage
    exit 1
fi

sudo mkdir -p /var/lib/AccountsService/users
sudo tee /var/lib/AccountsService/users/$ACCOUNT_USER <<EOF
[User]
Session=$SESSION
EOF
