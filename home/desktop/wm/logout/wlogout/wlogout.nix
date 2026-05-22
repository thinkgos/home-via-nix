{
  config,
  lib,
  pkgs,
  wme,
  ...
}:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = wme.power.lock;
        text = "锁屏 (L)";
        keybind = "l";
      }
      {
        label = "logout";
        action = wme.power.logout;
        text = "注销 (E)";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = wme.power.shutdown;
        text = "关机 (S)";
        keybind = "s";
      }
      {
        label = "reboot";
        action = wme.power.reboot;
        text = "重启 (R)";
        keybind = "r";
      }
      {
        label = "hibernate";
        action = wme.power.hibernate;
        text = "休眠 (H)";
        keybind = "h";
      }
      {
        label = "suspend";
        action = wme.power.suspend;
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
