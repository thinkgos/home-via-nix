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
      # 布局
      {
        _args = [
          (mkLuaInline ''mod .. " + bracketleft"'')
          (mkLuaInline ''hl.dsp.layout("cycleprev")'')
          { description = "切换到上一个窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + bracketright"'')
          (mkLuaInline ''hl.dsp.layout("cyclenext")'')
          { description = "切换到下一个窗口"; }
        ];
      }
    ];
  };
}
