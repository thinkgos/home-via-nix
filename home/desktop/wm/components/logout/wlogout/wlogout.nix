{
  config,
  lib,
  pkgs,

  ...
}:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "/bin/loginctl lock-session";
        text = "锁屏 (L)";
        keybind = "l";
      }
      {
        label = "logout";
        # action = "loginctl terminate-session $XDG_SESSION_ID";
        action = "/bin/notify-send -u critical '注销有BUG(logout)!'";
        text = "注销 (E)";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "/bin/systemctl poweroff";
        text = "关机 (S)";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "/bin/systemctl reboot";
        text = "重启 (R)";
        keybind = "r";
      }
      {
        # 休眠是写到swap文件(swap空间必须大于内存), 需要主板与BIOS/UEFI支持(主板必须支持ACPI S4状态)
        label = "hibernate";
        # action = "/bin/systemctl hibernate";
        action = "/bin/notify-send -u critical '系统暂不支持休眠(hibernate)!'";
        text = "休眠 (H)";
        keybind = "h";
      }
      {
        label = "suspend";
        action = "/bin/systemctl suspend";
        text = "挂起 (U)";
        keybind = "u";
      }
    ];
    # https://github.com/catppuccin/wlogout
    style = ''
      ${builtins.readFile ./style.gtk.css}
      /* 图标路径引用 */
      #lock { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png")); }
      #logout { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png")); }
      #suspend { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png")); }
      #hibernate { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png")); }
      #shutdown { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png")); }
      #reboot { background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png")); }
    '';
  };
}
