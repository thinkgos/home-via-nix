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
      # 截图/录屏
      {
        _args = [
          (mkLuaInline ''mod .. " + R"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchScreenRecorder)")
          { description = "交互式录屏"; }
        ];
      }
      {
        _args = [
          "ALT + Print"
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.misc.screenshot} -m window")'')
          { description = "窗口截图"; }
        ];
      }
      {
        _args = [
          "SHIFT + Print"
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.misc.screenshot} -m fullscreen")'')
          { description = "全屏截图"; }
        ];
      }
      {
        _args = [
          "Print"
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.misc.screenshot} -m region")'')
          { description = "选框截图"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Print"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.flameshot}/bin/flameshot gui")'')
          { description = "选框截图标注"; }
        ];
      }
    ];
  };
}
