#!/bin/bash

#! zswap 配置
#
# 修改 /etc/default/grub 中的 GRUB_CMDLINE_LINUX_DEFAULT 参数增加以下 zswap 配置, 后执行 sudo update-grub2
# zswap.enabled=1 zswap.compressor=zstd zswap.zpool=zsmalloc zswap.max_pool_percent=20

sudo tee /etc/security/limits.d/99-max-files.conf >/dev/null <<'EOF'
* soft nofile 1048576
* hard nofile 1048576
root soft nofile 1048576
root hard nofile 1048576
EOF

# 调整 swappiness 为 20
# 调整 vfs_cache_pressure 为 50
sudo tee /etc/sysctl.d/99-swappiness.conf >/dev/null <<'EOF'
vm.swappiness=20
vm.vfs_cache_pressure=50
EOF

# 调整 core dump 放在 /var/crash 目录下
sudo tee /etc/sysctl.d/99-core.conf >/dev/null <<'EOF'
kernel.core_pattern = /var/crash/core.%e.%p.%t
EOF

sudo tee /etc/sysctl.d/99-net.conf >/dev/null <<'EOF'
# 启用 FQ (Fair Queueing) 队列调度算法(BBR 强依赖此算法)
net.core.default_qdisc = fq
# 使用 BBR 拥塞控制算法
net.ipv4.tcp_congestion_control = bbr
# 扩大 TCP 接收/发送缓冲区 (针对高带宽延迟积 BDP 优化)
net.core.rmem_max = 67108864
net.core.wmem_max = 67108864
net.ipv4.tcp_rmem = 4096 87380 33554432
net.ipv4.tcp_wmem = 4096 65536 33554432

# 提高网络队列及连接处理能力 (防并发冲击)
# 允许送到队列的数据包最大设备队列
net.core.netdev_max_backlog = 10000
# 系统中每一个端口最大的监听队列长度 (Somaxconn)
net.core.somaxconn = 65535
# 半连接队列长度
net.ipv4.tcp_max_syn_backlog = 8192

# 优化 TIME_WAIT 套接字复用 (针对高并发短连接, 如 Web/API 服务)
# 允许将 TIME-WAIT sockets 重新用于新的 TCP 连接
net.ipv4.tcp_tw_reuse = 1
# 开启时间戳
net.ipv4.tcp_timestamps = 1
# 选择性重传
net.ipv4.tcp_sack = 1
# 系统保持 TIME_WAIT 套接字的最大数量
net.ipv4.tcp_max_tw_buckets = 262144
# 决定孤儿套接字(不属于任何进程的TCP连接)的最大数量
net.ipv4.tcp_max_orphans = 262144
# 降低断开连接时 FIN-WAIT-2 的超时时间 (默认 60s 降到 15s)
net.ipv4.tcp_fin_timeout = 15
# 保活时长, 回收僵尸连接
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_intvl = 30
net.ipv4.tcp_keepalive_probes = 3

# 其他安全性与稳定性优化
# 开启 TCP Fast Open (TFO), 允许在 SYN 包中携带数据, 减少握手时延 (3表示同时开启客户端和服务器端)
net.ipv4.tcp_fastopen = 3
# 开启TCP 窗口缩放
net.ipv4.tcp_window_scaling = 1
# 开启 SYN Cookies, 防御少量的 SYN Flood 攻击
net.ipv4.tcp_syncookies = 1
EOF

sudo sysctl --system
