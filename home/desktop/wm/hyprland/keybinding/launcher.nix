{
  config,
  lib,
  pkgs,
  wme,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # 应用启动器
      {
        _args = [
          (mkLuaInline ''mod .. " + T"'')
          (mkLuaInline ''hl.dsp.exec_cmd( "${pkgs.alacritty}/bin/alacritty")'')
          { description = "启动终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + grave"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.dropdown-terminal}/bin/wme-dropdown-terminal")'')
          { description = "启动下拉终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + N"'')
          (mkLuaInline ''hl.dsp.exec_cmd('"${pkgs.alacritty}/bin/alacritty" --class floating-terminal --title "floating-terminal"')'')
          { description = "启动浮动终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + N"'')
          (mkLuaInline ''hl.dsp.exec_cmd("warp-terminal")'')
          { description = "启动wrap终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + E"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.nemo}/bin/nemo")'')
          { description = "启动文件管理器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + B"'')
          (mkLuaInline ''hl.dsp.exec_cmd("google-chrome-stable")'')
          { description = "启动浏览器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + P"'')
          (mkLuaInline ''hl.dsp.exec_cmd("code")'')
          { description = "启动IDE"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + D"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.anyrun}/bin/anyrun close || ${pkgs.anyrun}/bin/anyrun")'')
          { description = "启动应用启动器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Space"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.vicinae}/bin/vicinae toggle")'')
          { description = "启动多功能启动器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + F1"'')
          (mkLuaInline ''hl.dsp.exec_cmd("hyprkcs")'')
          { description = "启动配置视图"; }
        ];
      }
    ];
  };
}
