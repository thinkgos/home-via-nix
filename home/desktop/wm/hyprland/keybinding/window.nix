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
      {
        _args = [
          (mkLuaInline ''mod .. " + A"'')
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.vicinae}/bin/vicinae vicinae://launch/wm/switch-windows")'')
          { description = "视图预览"; }
        ];
      }
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
          { description = "切换全屏模式(不保留状态栏)"; }
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
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse_down"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'l' })")
          { description = "聚焦左边窗口 - 鼠标滚轮"; }
        ];
      }
      {
        _args = [
          (mkLuaInline ''mod .. " + mouse_up"'')
          (mkLuaInline "hl.dsp.focus({ direction = 'r' })")
          { description = "聚焦右边窗口 - 鼠标滚轮"; }
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
      # # 工作区中移动窗口
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + Prior"'')
      #     (mkLuaInline "hl.dsp.move({ workspace = 'r-1' })")
      #     { description = "移动窗口到上一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + Next"'')
      #     (mkLuaInline "hl.dsp.move({ workspace = 'r+1' })")
      #     { description = "移动窗口到下一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + Home"'')
      #     (mkLuaInline "hl.dsp.move({ workspace = '1' })")
      #     { description = "移动窗口到第一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + End"'')
      #     (mkLuaInline ''hl.dsp.exec_cmd("${wme.window.move-to-last-workspace}")'')
      #     { description = "移动窗口到最后一个工作区"; }
      #   ];
      # }
      # # 工作区中移动窗口 (Mod+Shift+1-9)
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 1"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 1 })")
      #     { description = "移动窗口到工作区1"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 2"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 2 })")
      #     { description = "移动窗口到工作区2"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 3"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 3 })")
      #     { description = "移动窗口到工作区3"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 4"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 4 })")
      #     { description = "移动窗口到工作区4"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 5"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 5 })")
      #     { description = "移动窗口到工作区5"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 6"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 6 })")
      #     { description = "移动窗口到工作区6"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 7"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 7 })")
      #     { description = "移动窗口到工作区7"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 8"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 8 })")
      #     { description = "移动窗口到工作区8"; }
      #   ];
      # }
      # {
      #   _args = [
      #     (mkLuaInline ''mod .. " + SHIFT + 9"'')
      #     (mkLuaInline "hl.dsp.window.move({ workspace = 9 })")
      #     { description = "移动窗口到工作区9"; }
      #   ];
      # }
      # 窗口 resize 子映射
      {
        _args = [
          (mkLuaInline ''mod .. " + ALT + R"'')
          (mkLuaInline ''hl.dsp.submap("resize")'')
        ];
      }
    ];
    # 窗口 resize 子映射
    define_submap = {
      _args = [
        "resize"
        (lib.generators.mkLuaInline ''
          function()
            hl.bind("Up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
            hl.bind("Down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
            hl.bind("Left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
            hl.bind("Right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
            hl.bind("escape", hl.dsp.submap("reset"))
            hl.bind("catchall", hl.dsp.submap("reset"))
          end
        '')
      ];
    };
  };
}
