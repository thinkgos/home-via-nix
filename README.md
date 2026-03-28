# home-via-nix

- [Issue](ISSUES.md) 问题
- [Manual Install](MANUAL-INSTALL.md) 手动安装软件

## 1. **前置条件**

- [nix](https://nixos.org)
- [home-manager](https://nix-community.github.io/home-manager)
- [ansible](https://www.ansible.com)

**NOTE**:

- `home-manager`管理用户级配置, 使用`nix flakes`方式.
- `ansible`管理一些系统包和常用工具
- 其它商业或特殊软件见[Manual Install](MANUAL-INSTALL.md)

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
- 添加channel, `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs`
- 更新channel, `nix-channel --update`
- 添加相关help文档, `nix-env -i nix`.

## 4. 安装home-manager

- [Install home-manager via nix flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)

### home manager 切换

```shell
home-manager switch --flake .#thinkgo
```

## 5. 设置默认shell为zsh

`sudo chsh -s ~/.nix-profile/bin/zsh $USER` 设置默认shell为zsh
