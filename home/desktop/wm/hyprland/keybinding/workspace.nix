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
      # 工作空间管理
      # https://github.com/shezdy/hyprsplit
      # 聚焦工作空间
      {
        _args = [
          (mkLuaInline ''mod .. " + Prior"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 'r-1' })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 'r-1' })")
          { description = "聚焦上一个工作空间"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Next"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 'r+1' })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 'r+1' })")
          { description = "聚焦下一个工作空间"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Home"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 1 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 1 })")
          { description = "聚焦第一个工作空间"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + End"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${wme.focus-last-workspace}/bin/wme-focus-last-workspace")'')
          { description = "聚焦最后一个工作空间"; }
        ];
      }
      # 聚焦工作空间 (Mod+1-9)
      {
        _args = [
          (mkLuaInline ''mod .. " + 1"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 1 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 1 })")
          { description = "聚焦工作空间1"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 2"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 2 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 2 })")
          { description = "聚焦工作空间2"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 3"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 3 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 3 })")
          { description = "聚焦工作空间3"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 4"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 4 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 4 })")
          { description = "聚焦工作空间4"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 5"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 5 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 5 })")
          { description = "聚焦工作空间5"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 6"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 6 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 6 })")
          { description = "聚焦工作空间6"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 7"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 7 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 7 })")
          { description = "聚焦工作空间7"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 8"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 8 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 8 })")
          { description = "聚焦工作空间8"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + 9"'')
          # (mkLuaInline "hl.dsp.focus({ workspace = 9 })")
          (mkLuaInline "hl.plugin.hyprsplit.dsp.focus({ workspace = 9 })")
          { description = "聚焦工作空间9"; }
        ];
      }
    ];
  };
}
