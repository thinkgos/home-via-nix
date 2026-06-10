{
  config,
  lib,
  pkgs,
  wme,
  customize,
  ...
}:
{
  programs.niri.settings.binds = {
    "Ctrl+Alt+Delete" = {
      action.quit = [ ];
      repeat = false;
      hotkey-overlay.title = "注销当前用户会话/退出桌面";
    };
    "Mod+Alt+M" = {
      action.spawn = [
        "sh"
        "-c"
        ''${pkgs.zenity}/bin/zenity --question --text="确定要重启吗？" && /bin/systemctl reboot''
      ];
      repeat = false;
      hotkey-overlay.title = "重启系统";
    };
    "Mod+Alt+L" = {
      action.spawn = [
        "sh"
        "-c"
        "${wme.power.lock}"
      ];
      repeat = false;
      hotkey-overlay.title = "锁定屏幕";
    };
    "Mod+Alt+H" = {
      action.spawn = [ "${pkgs.hvn}/bin/hvn-toggle-waybar" ];
      repeat = false;
      hotkey-overlay.title = "隐藏/显示waybar";
    };
  };
}
