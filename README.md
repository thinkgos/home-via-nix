# home-via-nix

基于`home-manager`的用户级配置管理, ansible 管理系统包和github应用. 开发环境使用`mise`进行管理, 本仓库不涉及开发环境的管理.

- [Issue](ISSUES.md) 问题及解决方法
- [Manual Install](MANUAL-INSTALL.md) 手动安装软件

## 1. **前置条件**

- [nix](https://nixos.org)
- [home-manager](https://nix-community.github.io/home-manager)

**NOTE**:

- `home-manager`通过`nix flakes`方式管理用户级配置.
- [`ansible`](https://www.ansible.com) 管理系统包和github应用
- 其它商业或特殊软件使用手动安装[Manual Install](MANUAL-INSTALL.md).

## 2. 使用指南

### 2.1. 关闭SELINUX

#### 永久关闭 - 需重启

```shell
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
```

#### 临时关闭 - 无需重启, 但重后会失效

```shell
sudo setenforce 0
```

### 2.2. 安装nix

- [Install Nix](https://nixos.org/download/#download-nix)
- 添加channel, `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs`
- 更新channel, `nix-channel --update`
- 添加相关help文档, `nix-env -i nix`.

### 2.3. 安装home-manager

[Install home-manager via nix flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)

#### home manager 切换

```shell
# username: thinkgos, system: ubuntu25_10
home-manager switch --flake .#thinkgo-ubuntu25_10
# username: journey, system: ubuntu25_10
home-manager switch --flake .#journey-ubuntu25_10
# username: thinkgo, system: fedora-43
home-manager switch --flake .#thinkgo-fedora43
```

### 2.4. 设置默认shell为zsh

```shell
# 设置默认shell为zsh
sudo chsh -s ~/.nix-profile/bin/zsh $USER
```

### 2.5. 安装软件

ansible playbook 标签:

- `system`: 安装系统包
- `github`: 安装github应用

```shell
ansible-playbook site.yml -u <username> --tags system,github -K
```
