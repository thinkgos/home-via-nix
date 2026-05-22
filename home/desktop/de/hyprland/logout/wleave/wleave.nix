{
  config,
  lib,
  pkgs,
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
          action = "bt-action-screen-lock";
          text = "锁屏";
          keybind = "l";
          icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
        }
        {
          label = "logout";
          action = "/bin/notify-send -u critical '注销有BUG(logout)!'";
          text = "注销";
          keybind = "e";
          icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
        }
        {
          label = "shutdown";
          action = "/bin/systemctl poweroff";
          text = "关机";
          keybind = "s";
          icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
        }
        {
          label = "reboot";
          action = "/bin/systemctl reboot";
          text = "重启";
          keybind = "r";
          icon = "${pkgs.wleave}/share/wleave/icons/reboot.svg";
        }
        {
          label = "hibernate";
          action = "/bin/notify-send -u critical '系统暂不支持休眠(hibernate)!'";
          text = "休眠";
          keybind = "h";
          icon = "${pkgs.wleave}/share/wleave/icons/hibernate.svg";
        }
        {
          label = "suspend";
          action = "/bin/systemctl suspend";
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
