{
  config,
  lib,
  pkgs,
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
          (mkLuaInline ''mod .. " + Tab"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.vicinae}/bin/vicinae vicinae://launch/wm/switch-windows")'')
          { description = "视图预览"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + H"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.hvn}/bin/hvn-toggle-waybar")'')
          { description = "隐藏/显示waybar"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + L"'')
          (mkLuaInline ''hl.dsp.exec_cmd("/bin/loginctl lock-session")'')
          { description = "锁定屏幕"; }
        ];
      }
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
    ];
  };
}
