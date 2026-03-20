
# Issue

## 1. 桌面端启动器找不到相关程序

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

## 2. 桌面端启动器只有一部份显示

在1解决后, 仍有部份不显示, 主要是找不到二进制程序, 原因是`PATH`没有包含Nix对应路径.

```shell
 systemctl --user show-environment | grep PATH
```

- [issues 1439](https://github.com/nix-community/home-manager/issues/1439)
- [BohdanTkachenko gist](https://gist.github.com/BohdanTkachenko/6ba2730ff54ecbb2d7aed22dec3507d5)
- [systemd/systemd#32423](https://github.com/systemd/systemd/issues/32423#issuecomment-2907893187)
- [pr 7949](https://github.com/nix-community/home-manager/pull/7949)

## 3. 禁用用户级IBus

```shell
systemctl --user mask org.freedesktop.IBus.session.GNOME.service
```

## 4. code出现sandbox权限问题

放开`AppArmor`权限

```shell
echo "kernel.apparmor_restrict_unprivileged_userns=0" | sudo tee /etc/sysctl.d/60-apparmor-namespace.conf
```

### 5. 用户目录名称改成英文

```shell
LANG=C xdg-user-dirs-gtk-update
```

### 6. 远程桌面在无显示器时无法使用

```shell
gsettings set org.gnome.desktop.remote-desktop.rdp screen-share-mode 'extend'
```

**NOTE**: 远程桌面在无显示器时无法使用, 需要在图形界面先进行登陆.(核心原因, 缺少图形会话)