
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

## Hyprland

### 1. 安装sddm启动hyprland出现白色面板

主要是sddm是有引入kde相关的依赖, 如`xdg-desktop-portal-kde`, `xwaylandvideobridge`.

```bash
# 查看系统级的自动启动项
ls /etc/xdg/autostart | grep videobridge

# 查看用户级的自动启动项
ls ~/.config/autostart | grep videobridge

# 查看是否作为 systemd 用户服务运行
systemctl --user list-unit-files | grep videobridge

# 完全清除 kde和xwaylandvideobridge
sudo apt purge xdg-desktop-portal-kde xwaylandvideobridge
```

### hyprlock锁屏后无法登陆

权限和共享库问题, `Hyprlock` 没有权限通过 PAM 验证你的密码.

see [issues 7027](https://github.com/nix-community/home-manager/issues/7027)

```bash
# 找不到pam的相关库, 软链接过去
sudo ln -s /usr/lib/x86_64-linux-gnu/security /usr/lib/security
# 配置hyprlock的pam配置.
sudo bash -c 'cat > /etc/pam.d/hyprlock << EOF
#%PAM-1.0
auth    required        pam_unix.so
@include common-account
@include common-session
EOF'
```

home-manager 配置:

```nix
  programs.hyprlock = {
    enable = true;
        package = pkgs.hyprlock.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.patchelf ];
      postFixup = ''
        file="$out/bin/hyprlock"
        patchelf --replace-needed libpam.so.0 /usr/lib/x86_64-linux-gnu/libpam.so.0 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libaudit.so.1 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcap-ng.so.0 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcrypt.so.1 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libpam_misc.so.0 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcap.so.2 "$file"
      '';
    });
    # ...你的配置
  };
```

问题排查:

```bash
# 查看日志
sudo tail -f /var/log/auth.log
# 锁屏会话
loginctl lock-session

# 解锁会话
pkill -USR1 hyprlock
```
