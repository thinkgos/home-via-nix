# home-via-nix

## 1. 关闭SELINUX

### 永久关闭 - 需重启

```shell
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
```

### 临时关闭 - 无需重启, 但启重后失败

```shell
sudo setenforce 0
```

## 2. 安装nix

- [Install Nix](https://nixos.org/download/#download-nix)
- 添加channel, `nix-channel --add https://nixos.org/channels/nixos-25.11 nixpkgs`
- 更新channel, `nix-channel --update`
- 添加相关help文档, `nix-env -i nix`.

## 3. 安装home-manager

- [Install home-manager via nix flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)

### home manager 切换

```shell
home-manager switch --flake .#thinkgo
```

`sudo chsh -s ~/.nix-profile/bin/zsh $USER` 设置默认shell为zsh
