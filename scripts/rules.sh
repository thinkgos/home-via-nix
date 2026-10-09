#!/bin/bash

source $(cd "$(dirname "${BASH_SOURCE[0]}")/lib/" && pwd)/log4sh.sh

# moonlight/sunshine的键盘/鼠标才能工作
log::info "配置sunshine udev规则(注意: 重启后生效)..."

sudo tee /etc/udev/rules.d/85-sunshine.rules >/dev/null <<EOF
KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
EOF

# codex 沙箱问题, codex打包了bubblewrap, 需要nix的apparmor规则
sudo tee /etc/apparmor.d/local-nix-bwrap >/dev/null <<'EOF'
abi <abi/4.0>,
include <tunables/global>

profile local-nix-bwrap /nix/store/*-bubblewrap-*/bin/bwrap flags=(unconfined) {
  userns,
  include if exists <local/local-nix-bwrap>
}
EOF
sudo apparmor_parser -r /etc/apparmor.d/local-nix-bwrap
