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
            description = "拖拽窗口 - 鼠标左键";
          }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse:273"'')
          (mkLuaInline "hl.dsp.window.resize()")
          {
            mouse = true;
            description = "缩放窗口 - 鼠标右键";
          }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse_down"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'l' })")
          { description = "聚焦左边窗口 - 鼠标滚轮向上"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse_up"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'r' })")
          { description = "聚焦右边窗口 - 鼠标滚轮向下"; }
        ];
      }
    ];
  };
}
