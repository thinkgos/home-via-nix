#!/bin/bash

#! zswap 配置
#
# 修改 /etc/default/grub 中的 GRUB_CMDLINE_LINUX_DEFAULT 参数增加以下 zswap 配置, 后执行 sudo update-grub2
# zswap.enabled=1 zswap.compressor=zstd zswap.zpool=zsmalloc zswap.max_pool_percent=20

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
