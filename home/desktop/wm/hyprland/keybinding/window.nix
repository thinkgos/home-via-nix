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
      # 窗口标签组
      {
        _args = [
          (mkLuaInline ''mod .. " + G"'')
          (mkLuaInline "hl.dsp.group.toggle()")
          { description = "窗口成组"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Y"'')
          (mkLuaInline ''hl.dsp.group.lock_active({ action = "toggle" })'')
          { description = "锁定窗口组"; }
        ];
      }
      # 窗口管理
      {
        _args = [
          (mkLuaInline ''mod .. " + Q"'')
          (mkLuaInline "hl.dsp.window.close()")
          { description = "关闭窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + V"'')
          (mkLuaInline "hl.dsp.window.float()")
          { description = "切换浮动窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + F"'')
          (mkLuaInline ''hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })'')
          { description = "切换全屏模式"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + M"'')
          (mkLuaInline ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })'')
          { description = "切换最大化模式"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Tab"'')
          (mkLuaInline "hl.dsp.window.cycle_next()")
          { description = "聚焦下一个窗口"; }
        ];
      }
      # 聚焦窗口 (Mod+Arrow) ✅
      {
        _args = [
          (mkLuaInline ''mod .. " + Left"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'l' })")
          { description = "聚焦左边窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Right"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'r' })")
          { description = "聚焦右边窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Up"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'u' })")
          { description = "聚焦上方窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Down"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'd' })")
          { description = "聚焦下方窗口"; }
        ];
      }
      # 聚焦窗口 (Mod+<HJKL>)
      {
        _args = [
          (mkLuaInline ''mod .. " + H"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'l' })")
          { description = "聚焦左边窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + L"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'r' })")
          { description = "聚焦右边窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + K"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'u' })")
          { description = "聚焦上方窗口"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + J"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'd' })")
          { description = "聚焦下方窗口"; }
        ];
      }
      # 移动窗口 (Mod+Shift+Arrow) ✅
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + Left"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'l' })")
          { description = "移动窗口到左边"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + Right"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'r' })")
          { description = "移动窗口到右边"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + Up"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'u' })")
          { description = "移动窗口到上方"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + Down"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'd' })")
          { description = "移动窗口到下方"; }
        ];
      }
      # 移动窗口 (Mod+Shift+[HJKL])
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + H"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'l' })")
          { description = "移动窗口到左边"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + L"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'r' })")
          { description = "移动窗口到右边"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + K"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'u' })")
          { description = "移动窗口到上方"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + SHIFT + J"'')
          (mkLuaInline "hl.dsp.window.move({ direction = 'd' })")
          { description = "移动窗口到下方"; }
        ];
      }
      # # 工作空间中移动窗口
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + Prior"'')
      #     (mkLuaInline "hl.dsp.move({ workspace = 'r-1' })")
      #     { description = "移动窗口到上一个工作空间"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + Next"'')
      #     (mkLuaInline "hl.dsp.move({ workspace = 'r+1' })")
      #     { description = "移动窗口到下一个工作空间"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + Home"'')
      #     (mkLuaInline "hl.dsp.move({ workspace = '1' })")
      #     { description = "移动窗口到第一个工作空间"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + End"'')
      #     (mkLuaInline ''hl.dsp.exec_cmd("${wme.window.move-to-last-workspace}")'')
      #     { description = "移动窗口到最后一个工作空间"; }
      #   ];
      # }
      # # 工作空间中移动窗口 (Mod+Shift+1-9)
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 1"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 1 })")
      #     { description = "移动窗口到工作空间1"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 2"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 2 })")
      #     { description = "移动窗口到工作空间2"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 3"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 3 })")
      #     { description = "移动窗口到工作空间3"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 4"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 4 })")
      #     { description = "移动窗口到工作空间4"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 5"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 5 })")
      #     { description = "移动窗口到工作空间5"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 6"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 6 })")
      #     { description = "移动窗口到工作空间6"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 7"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 7 })")
      #     { description = "移动窗口到工作空间7"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 8"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 8 })")
      #     { description = "移动窗口到工作空间8"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 9"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 9 })")
      #     { description = "移动窗口到工作空间9"; }
      #   ];
      # }
      # 窗口宽度调整
      {
        _args = [
          (mkLuaInline ''mod .. " + Minus"'')
          (mkLuaInline "hl.dsp.window.resize({ x = -20, y = 0, relative = true })")
          {
            repeating = true;
            description = "调整窗口宽度-20";
          }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + Equal"'')
          (mkLuaInline "hl.dsp.window.resize({ x = 20, y = 0, relative = true })")
          {
            repeating = true;
            description = "调整窗口宽度+20";
          }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + Minus"'')
          (mkLuaInline "hl.dsp.window.resize({ x = 0, y = -20, relative = true })")
          {
            repeating = true;
            description = "调整窗口高度-20";
          }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + Equal"'')
          (mkLuaInline "hl.dsp.window.resize({ x = 0, y = 20, relative = true })")
          {
            repeating = true;
            description = "调整窗口高度+20";
          }
        ];
      }
    ];
  };
}
