# home-via-nix

## 1. 前置条件

- [nix](https://nixos.org)
- [home-manager](https://nix-community.github.io/home-manager)
- [mise](https://mise.jdx.dev)
- [ansible](https://www.ansible.com)

NOTE:

- `home-manager`管理用户级配置, 使用`nix flakes`方式.
- `mise`管理一些常用的开发环境和部份编译工具
- `ansible`管理一些系统包

## 2. 关闭SELINUX

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
- 添加channel, `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs`
- 更新channel, `nix-channel --update`
- 添加相关help文档, `nix-env -i nix`.

## 3. 安装home-manager

- [Install home-manager via nix flakes](https://nix-community.github.io/home-manager/index.xhtml#ch-nix-flakes)

### home manager 切换

```shell
home-manager switch --flake .#thinkgo
```

`sudo chsh -s ~/.nix-profile/bin/zsh $USER` 设置默认shell为zsh

## 4. Issue

### 4.1 桌面端启动器找不到相关程序

`XDG_DATA_DIRS` 没有Nix对应路径

```shell
systemctl --user show-environment | grep XDG_DATA_DIRS
```

`home-manager`添加以下配置暂时解决

```nix
  xdg.enable = true;
  targets.genericLinux = {
    enable = true;
    gpu.enable = true;
  };
```

### 4.2 桌面端启动器只有一部份显示

在4.1解决后, 仍有部份不显示, 主要是找不到二进制程序, 原因是`PATH`没有包含Nix对应路径.

```shell
 systemctl --user show-environment | grep PATH
```

- [issues 1439](https://github.com/nix-community/home-manager/issues/1439)
- [BohdanTkachenko gist](https://gist.github.com/BohdanTkachenko/6ba2730ff54ecbb2d7aed22dec3507d5)
- [systemd/systemd#32423](https://github.com/systemd/systemd/issues/32423#issuecomment-2907893187)
- [pr 7949](https://github.com/nix-community/home-manager/pull/7949)

### 4,3 禁用用户级IBus

```shell
systemctl --user mask org.freedesktop.IBus.session.GNOME.service
```

### 4.4 code出现sandbox权限问题

放开`AppArmor`权限

```shell
echo "kernel.apparmor_restrict_unprivileged_userns=0" | sudo tee /etc/sysctl.d/60-apparmor-namespace.conf
```

#### 4.5 用户目录名称改成英文

```shell
LANG=C xdg-user-dirs-gtk-update
```

#### 4.6 远程桌面在无显示器时无法使用

```shell
gsettings set org.gnome.desktop.remote-desktop.rdp screen-share-mode 'extend'
```
