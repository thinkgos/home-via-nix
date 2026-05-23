{
  config,
  lib,
  pkgs,
  wme,
  ...
}:
{
  # wleave
  # https://github.com/AMNatty/wleave
  programs.wleave = {
    enable = true;
    # https://github.com/AMNatty/wleave#configuration
    settings = {
      margin = 200;
      column-spacing = "30px";
      row-spacing = "30px";
      buttons-per-row = "1/2";
      delay-command-ms = 100;
      close-on-lost-focus = true;
      show-keybinds = true;
      no-version-info = true;
      buttons = [
        {
          label = "lock";
          action = wme.power.lock;
          text = "锁屏";
          keybind = "l";
          icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
        }
        {
          label = "logout";
          action = wme.power.logout;
          text = "注销";
          keybind = "e";
          icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
        }
        {
          label = "shutdown";
          action = wme.power.shutdown;
          text = "关机";
          keybind = "s";
          icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
        }
        {
          label = "reboot";
          action = wme.power.reboot;
          text = "重启";
          keybind = "r";
          icon = "${pkgs.wleave}/share/wleave/icons/reboot.svg";
        }
        {
          label = "hibernate";
          action = wme.power.hibernate;
          text = "休眠";
          keybind = "h";
          icon = "${pkgs.wleave}/share/wleave/icons/hibernate.svg";
        }
        {
          label = "suspend";
          action = wme.power.suspend;
          text = "挂起";
          keybind = "u";
          icon = "${pkgs.wleave}/share/wleave/icons/suspend.svg";
        }
      ];
    };
    # https://github.com/AMNatty/wleave#styling
    # https://github.com/catppuccin/wlogout
    style = builtins.readFile ./style.gtk.css;
  };
}
