
# 使用指南

**前置条件**:

- [nix](https://nixos.org)
- [home-manager](https://nix-community.github.io/home-manager)

**NOTE**:

- `home-manager`通过`nix flakes`方式管理用户级配置.
- [`ansible`](https://www.ansible.com) 管理系统包,github,flathub应用
- 其它商业或特殊软件使用手动安装[Manual Install](system/manual-install.md).

## 1. ubuntu server(可选)

安装 `hyprland` 要从 `ubuntu server` 开始, 需要执行 [bootstrap](../bootstrap.sh).

## 2. 关闭SELINUX

### 永久关闭 - 需重启

```shell
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
```

### 临时关闭 - 无需重启, 但重后会失效

```shell
sudo setenforce 0
```

## 3. 安装nix

- [Install Nix](https://nixos.org/download/#download-nix)
- 启用flakes和nix-command实验功能：

```shell
mkdir -p /etc/nix/nix.conf
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

- 添加channel, `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs`
- 更新channel, `nix-channel --update`
- 添加相关help文档, `nix-env -i nix`.

## 4. 安装home-manager

[Install home-manager via nix flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)

### home manager 切换

```shell
# username: thinkgos, system: ubuntu25_10
home-manager switch --flake .#thinkgo-laptop
# username: cors, system: ubuntu25_10
home-manager switch --flake .#cors-ubuntu25_10
# username: thinkgos, system: ubuntu25_10
home-manager switch --flake .#thinkgo-ubuntu25_10
# username: thinkgo, system: fedora-43
home-manager switch --flake .#thinkgo-fedora43
# 仅构建配置（不切换，用于测试）
home-manager build --flake .#<配置名>
# 查看配置生成历史
home-manager generations
```

## 5. 设置默认shell为zsh

```shell
# 设置默认shell为zsh
sudo chsh -s ~/.nix-profile/bin/zsh $USER
```

## 6. 安装软件

ansible playbook 标签:

- `system`: 安装系统包
- `github`: 安装github应用

```shell
ansible-playbook site.yml -u <username> --tags system,github -K
```
