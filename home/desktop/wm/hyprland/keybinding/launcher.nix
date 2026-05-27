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
      # 应用启动器
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + T"'')
          (mkLuaInline ''hl.dsp.exec_cmd("warp-terminal")'')
          { description = "启动wrap终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + T"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchTerminal)")
          { description = "启动终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + E"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchFileManager)")
          { description = "启动文件管理器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + C"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchCalculator)")
          { description = "启动计算器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + B"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchBrowser)")
          { description = "启动浏览器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + P"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchIde)")
          { description = "启动IDE"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + grave"'')
          (mkLuaInline "hl.dsp.exec_cmd(launchDropdownTerminal)")
          { description = "切换到下拉终端"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + A"'')
          (mkLuaInline "hl.dsp.exec_cmd(popupAppLauncher)")
          { description = "启动应用启动器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Space"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.vicinae}/bin/vicinae toggle")'')
          { description = "启动应用启动器"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + F1"'')
          (mkLuaInline "hl.dsp.exec_cmd(popupKeybindingHelp)")
          { description = "启动帮助按键绑定"; }
        ];
      }
    ];
  };
}
