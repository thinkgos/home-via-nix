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
          (mkLuaInline ''mod .. " + mouse_up"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'l' })")
          { description = "聚焦左边窗口 - 鼠标滚轮向上"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse_down"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'r' })")
          { description = "聚焦右边窗口 - 鼠标滚轮向下"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + mouse_up"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'l' })")
          { description = "移动窗口到左边 - 鼠标滚轮向上"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + mouse_down"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'r' })")
          { description = "移动窗口到右边 - 鼠标滚轮向下"; }
        ];
      }
    ];
  };
}
