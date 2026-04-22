# 系统

## 扩大 swap

```bash
# 查看当前swap配置
swapon --show
# 关闭swap
sudo swapoff /swap.img  # 这里的路径 swapon --show 的结果修改
# 删除旧的swap文件
sudo rm /swap.img
# 快速预留32G
sudo fallocate -l 32G /swap.img
# 只有root用户可读写
sudo chmod 600 /swap.img
# 格式化为swap格式
sudo mkswap /swap.img
# 启用swap
sudo swapon /swap.img
# 挂久化配置
# vim /etc/fstab
```
