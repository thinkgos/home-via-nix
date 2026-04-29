#!/bin/bash

NETWORKD_WAIT_ONLINE_CONF="/etc/systemd/system/systemd-networkd-wait-online.service.d/override.conf"

echo "配置网络启动等待时间..."

sudo mkdir -p $(dirname "$NETWORKD_WAIT_ONLINE_CONF")
sudo tee "$NETWORKD_WAIT_ONLINE_CONF" >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any --timeout=5
EOF
sudo systemctl daemon-reload
echo "配置网络启动等待时间已生效！"
echo "当前网络启动等待时间配置内容："
systemctl cat "$NETWORKD_WAIT_ONLINE_CONF" | grep ExecStart
