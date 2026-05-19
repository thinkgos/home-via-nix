{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # 鼠标绑定 ✅
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse:272"'')
          (mkLuaInline "hl.dsp.window.drag()")
          {
            mouse = true;
            description = "拖拽窗口";
          }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse:273"'')
          (mkLuaInline "hl.dsp.window.resize()")
          {
            mouse = true;
            description = "缩放窗口";
          }
        ];
      }
    ];
  };
}
