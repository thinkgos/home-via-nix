#!/bin/bash

set -euo pipefail

source $(cd "$(dirname "${BASH_SOURCE[0]}")/scripts/lib/" && pwd)/log4sh.sh

usage() {
	echo "Usage: $0 [-p|--proxy host:port] [-h|--help]"
	echo ""
	echo "  -p, --proxy <host:port> 代理地址, 仅支持 host:port 格式"
	echo "                          也可通过环境变量 http_proxy/https_proxy/all_proxy 指定"
	echo "  -h, --help              显示帮助"
	echo ""
	echo "Example:"
	echo "  $0"
	echo "  $0 -p 127.0.0.1:7890"
	exit 1
}

PROXY_HOST=""

PARSED=$(getopt -o p:h --long proxy:,help -n "$0" -- "$@") || usage
eval set -- "$PARSED"
while true; do
	case "$1" in
	-p | --proxy)
		PROXY_HOST="$2"
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

# 代理: -p 参数覆盖一切, 否则逐个读环境变量
if [[ -n "$PROXY_HOST" ]]; then
	if [[ "$PROXY_HOST" == *://* || "$PROXY_HOST" != *:* ]]; then
		log::error "代理地址仅支持 host:port 格式, 如 127.0.0.1:7890 (收到: $PROXY_HOST)"
		usage
	fi
	export http_proxy="http://${PROXY_HOST}"
	export https_proxy="http://${PROXY_HOST}"
	export all_proxy="socks5://${PROXY_HOST}"
	export socks_proxy="socks5://${PROXY_HOST}"
else
	PROXY_HOST="127.0.0.1:7890"
	export http_proxy="${http_proxy:-http://${PROXY_HOST%/}}"
	export https_proxy="${https_proxy:-http://${PROXY_HOST%/}}"
	export socks_proxy="${socks_proxy:-socks5://${PROXY_HOST%/}}"
	export all_proxy="${all_proxy:-socks5://${PROXY_HOST%/}}"
fi
export no_proxy="${no_proxy:-localhost,127.0.0.1,10.0.0.0/8,127.17.0.0/12,192.168.0.0/1}"

log::info "一键升级..."

log::info "升级 apt 系统包..."
sudo apt update
sudo apt upgrade -y

# root 登录环境下升级系统 profile 中的 Nix（多用户安装）
# sudo -i 会重置环境，需显式转发代理变量
log::info "升级 Nix root..."
sudo -i env \
	http_proxy="$http_proxy" \
	https_proxy="$https_proxy" \
	socks_proxy="$socks_proxy" \
	all_proxy="$all_proxy" \
	no_proxy="$no_proxy" \
	nix upgrade-nix

log::info "升级 Nix default..."
sudo -i env \
	http_proxy="$http_proxy" \
	https_proxy="$https_proxy" \
	socks_proxy="$socks_proxy" \
	all_proxy="$all_proxy" \
	no_proxy="$no_proxy" \
	nix upgrade-nix --profile /nix/var/nix/profiles/default

log::info "升级 flatpak user..."
flatpak update --user -y
log::info "升级 flatpak system..."
flatpak update --system -y

log::info "升级 uv tool..."
uv tool upgrade --all

log::info "一键升级完成"
