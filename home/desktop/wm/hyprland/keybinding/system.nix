{
  config,
  lib,
  pkgs,
  wme,
  customize,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # 系统
      {
        _args = [
          "CTRL + ALT + Delete"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.zenity}/bin/zenity --question --text=\"确定要登出 $USER 吗？\" && hyprshutdown -t \"注销中...\"")'')
          { description = "注销当前用户会话/退出桌面"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + M"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.zenity}/bin/zenity --question --text=\"确定要重启吗？\" && hyprshutdown -t \"重启中...\" --post-cmd \"/bin/systemctl reboot\"")'')
          { description = "重启系统"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + L"'')
          (mkLuaInline "hl.dsp.exec_cmd(actionLockScreen)")
          { description = "锁定屏幕"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + H"'')
          (mkLuaInline "hl.dsp.exec_cmd(actionToggleWaybar)")
          { description = "隐藏/显示waybar"; }
        ];
      }
    ];
  };
}
