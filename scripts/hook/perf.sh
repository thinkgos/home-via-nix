#!/bin/bash

# 调整 swappiness 为 20
# 调整 vfs_cache_pressure 为 50
sudo tee /etc/sysctl.d/99-swappiness.conf >/dev/null <<EOF
vm.swappiness=20
vm.vfs_cache_pressure=50
EOF

# 调整 core dump 放在 /var/crash 目录下
sudo tee /etc/sysctl.d/99-core.conf >/dev/null <<EOF
kernel.core_pattern = /var/crash/core.%e.%p.%t
EOF

sudo sysctl --system
