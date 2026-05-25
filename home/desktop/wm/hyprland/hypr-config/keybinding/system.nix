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
          (mkLuaInline ''mod .. " + ALT + Delete"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.pkgs.power}/bin/wme-power -m logout")'')
          { description = "注销当前用户会话/退出桌面"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + M"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.pkgs.power}/bin/wme-power -m reboot")'')
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
