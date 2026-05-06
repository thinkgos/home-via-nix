#!/bin/bash

# swapon --show 查看当前swap配置
OLD_SWAP_FILE="/swap.img"
NEW_SWAP_FILE="/swapfile"
SWAP_SIZE="32G"

# 关闭swap
sudo swapoff $OLD_SWAP_FILE
# 删除旧的swap文件
sudo rm -f $OLD_SWAP_FILE
# 快速预留swap大小
sudo fallocate -l $SWAP_SIZE $NEW_SWAP_FILE
# 只有root用户可读写
sudo chmod 600 $NEW_SWAP_FILE
# 格式化为swap格式
sudo mkswap $NEW_SWAP_FILE
# 启用swap
sudo swapon $NEW_SWAP_FILE

# 挂久化配置
FSTAB_LINE="$NEW_SWAP_FILE none swap sw 0 0"
# 如果已存在任何 swapfile/swap.img 配置，则替换
if grep -qF "$OLD_SWAP_FILE" /etc/fstab || grep -qF "$NEW_SWAP_FILE" /etc/fstab; then
    sudo sed -i "s|^$OLD_SWAP_FILE.*|$FSTAB_LINE|; s|^$NEW_SWAP_FILE.*|$FSTAB_LINE|" /etc/fstab
else
    echo "$FSTAB_LINE" | sudo tee -a /etc/fstab >/dev/null
fi

echo "Swap 配置完成"
swapon --show
