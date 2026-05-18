{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  mod = "SUPER";
  launchTerminal = "${pkgs.alacritty}/bin/alacritty";
  launchDropdownTerminal = "blast-dropdown-terminal";
  launchFileManager = "${pkgs.nemo}/bin/nemo";
  launchCalculator = "/bin/pkill qalculate-gtk || ${pkgs.qalculate-gtk}/bin/qalculate-gtk";
  launchBrowser = "google-chrome";
  launchIde = "code";
  launchScreenRecorder = "/bin/pkill kooha || flatpak run io.github.seadve.Kooha";
  appLauncher = "/bin/pkill rofi || ${pkgs.rofi}/bin/rofi -show drun";
  lockScreen = "blast-screen-lock";
  helpKeybinding = "hyprkcs";
  toggleWaybar = "blast-toggle-waybar";

  mkLuaInline = lib.generators.mkLuaInline;
  mkLuaInlineViaExecCmd = cmd: mkLuaInline ''hl.dsp.exec_cmd("${cmd}")'';
in
{
  # Hyprland 键盘绑定
  # https://wiki.hypr.land/Configuring/Binds/
  wayland.windowManager.hyprland.settings = {
    # NOTE:
    # `Super` + `A`: 显示工作区和应用启动器概览(hyprshell支持)
    # `Alt` + `Tab`: 切换应用程序(hyprshell支持)
    bind = [
      # 系统
      {
        _args = [
          "${mod} + ALT + Delete"
          (mkLuaInlineViaExecCmd "blast-shutdown logout")
          { description = "注销当前用户会话/退出桌面"; }
        ];
      }
      {
        _args = [
          "${mod} + ALT + M"
          (mkLuaInlineViaExecCmd "blast-shutdown reboot")
          { description = "重启系统"; }
        ];
      }
      # 窗口 resize 子映射
      {
        _args = [
          "${mod} + ALT + R"
          (mkLuaInline ''hl.dsp.submap("resize")'')
        ];
      }

      {
        _args = [
          "${mod} + ALT + T"
          (mkLuaInlineViaExecCmd "warp-terminal")
          { description = "启动wrap终端"; }
        ];
      }
      {
        _args = [
          "${mod} + L"
          (mkLuaInlineViaExecCmd lockScreen)
          { description = "锁定屏幕"; }
        ];
      }
      {
        _args = [
          "${mod} + H"
          (mkLuaInlineViaExecCmd toggleWaybar)
          { description = "隐藏/显示waybar"; }
        ];
      }
      {
        _args = [
          "${mod} + G"
          (mkLuaInline "hl.dsp.group.toggle()")
          { description = "窗口成组"; }
        ];
      }
      {
        _args = [
          "${mod} + Y"
          (mkLuaInline ''hl.dsp.group.lock_active({ action = "toggle" })'')
          { description = "锁定窗口组"; }
        ];
      }

      # 截图/录屏
      {
        _args = [
          "${mod} + R"
          (mkLuaInlineViaExecCmd launchScreenRecorder)
          { description = "交互式录屏"; }
        ];
      }
      {
        _args = [
          "ALT + Print"
          (mkLuaInlineViaExecCmd "blast-screen window")
          { description = "窗口截图"; }
        ];
      }
      {
        _args = [
          "SHIFT + Print"
          (mkLuaInlineViaExecCmd "blast-screen fullscreen")
          { description = "全屏截图"; }
        ];
      }
      {
        _args = [
          "Print"
          (mkLuaInlineViaExecCmd "blast-screen region")
          { description = "选框截图"; }
        ];
      }
      {
        _args = [
          "${mod} + Print"
          (mkLuaInlineViaExecCmd "${pkgs.flameshot}/bin/flameshot gui")
          { description = "选框截图标注"; }
        ];
      }

      # 应用
      {
        _args = [
          "${mod} + T"
          (mkLuaInlineViaExecCmd launchTerminal)
          { description = "启动终端"; }
        ];
      }
      {
        _args = [
          "${mod} + E"
          (mkLuaInlineViaExecCmd launchFileManager)
          { description = "启动文件管理器"; }
        ];
      }
      {
        _args = [
          "${mod} + C"
          (mkLuaInlineViaExecCmd launchCalculator)
          { description = "启动计算器"; }
        ];
      }
      {
        _args = [
          "${mod} + B"
          (mkLuaInlineViaExecCmd launchBrowser)
          { description = "启动浏览器"; }
        ];
      }
      {
        _args = [
          "${mod} + P"
          (mkLuaInlineViaExecCmd launchIde)
          { description = "启动IDE"; }
        ];
      }
      {
        _args = [
          "${mod} + grave"
          (mkLuaInlineViaExecCmd launchDropdownTerminal)
          { description = "切换到下拉终端"; }
        ];
      }
      {
        _args = [
          "${mod} + Return"
          (mkLuaInlineViaExecCmd appLauncher)
          { description = "启动应用启动器"; }
        ];
      }
      {
        _args = [
          "${mod} + F1"
          (mkLuaInlineViaExecCmd helpKeybinding)
          { description = "启动帮助按键绑定"; }
        ];
      }

      # 布局
      {
        _args = [
          "${mod} + bracketleft"
          (mkLuaInline ''hl.dsp.layout("cycleprev")'')
          { description = "切换到上一个窗口"; }
        ];
      }
      {
        _args = [
          "${mod} + bracketright"
          (mkLuaInline ''hl.dsp.layout("cyclenext")'')
          { description = "切换到下一个窗口"; }
        ];
      }

      # 窗口管理
      {
        _args = [
          "${mod} + Q"
          (mkLuaInline "hl.dsp.window.close()")
          { description = "关闭窗口"; }
        ];
      }
      {
        _args = [
          "${mod} + F"
          (mkLuaInline ''hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })'')
          { description = "切换全屏模式(不保留状态栏)"; }
        ];
      }
      {
        _args = [
          "${mod} + M"
          (mkLuaInline ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })'')
          { description = "切换最大化模式(保留状态栏)"; }
        ];
      }
      {
        _args = [
          "${mod} + V"
          (mkLuaInline "hl.dsp.window.float()")
          { description = "切换浮动窗口"; }
        ];
      }
      {
        _args = [
          "${mod} + Tab"
          (mkLuaInline "hl.dsp.window.cycle_next()")
          { description = "切换到下一个窗口"; }
        ];
      }
      # 聚焦窗口 (Mod+Arrow — same as niri) ✅
      {
        _args = [
          "${mod} + Left"
          (mkLuaInline "hl.dsp.focus({ direction = 'l' })")
          { description = "聚焦左边窗口"; }
        ];
      }
      {
        _args = [
          "${mod} + Right"
          (mkLuaInline "hl.dsp.focus({ direction = 'r' })")
          { description = "聚焦右边窗口"; }
        ];
      }
      {
        _args = [
          "${mod} + Up"
          (mkLuaInline "hl.dsp.focus({ direction = 'u' })")
          { description = "聚焦上方窗口"; }
        ];
      }
      {
        _args = [
          "${mod} + Down"
          (mkLuaInline "hl.dsp.focus({ direction = 'd' })")
          { description = "聚焦下方窗口"; }
        ];
      }
      # 移动窗口 (Mod+Shift+Arrow — same as niri) ✅
      {
        _args = [
          "${mod} + SHIFT + Left"
          (mkLuaInline "hl.dsp.window.move({ direction = 'l' })")
          { description = "移动窗口到左边"; }
        ];
      }
      {
        _args = [
          "${mod} + SHIFT + Right"
          (mkLuaInline "hl.dsp.window.move({ direction = 'r' })")
          { description = "移动窗口到右边"; }
        ];
      }
      {
        _args = [
          "${mod} + SHIFT + Up"
          (mkLuaInline "hl.dsp.window.move({ direction = 'u' })")
          { description = "移动窗口到上方"; }
        ];
      }
      {
        _args = [
          "${mod} + SHIFT + Down"
          (mkLuaInline "hl.dsp.window.move({ direction = 'd' })")
          { description = "移动窗口到下方"; }
        ];
      }

      # 工作区管理
      # https://github.com/shezdy/hyprsplit
      # 工作区切换
      # {
      #   _args = [
      #     "${mod} + mouse_down"
      #     (mkLuaInline "hl.dsp.focus({ workspace = 'r-1' })")
      #     { description = "鼠标滚轮-上一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + mouse_up"
      #     (mkLuaInline "hl.dsp.focus({ workspace = 'r+1' })")
      #     { description = "鼠标滚轮-下一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + Prior"
      #     (mkLuaInline "hl.dsp.focus({ workspace = 'r-1' })")
      #     { description = "切换到上一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + Next"
      #     (mkLuaInline "hl.dsp.focus({ workspace = 'r+1' })")
      #     { description = "切换到下一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + Home"
      #     (mkLuaInline "hl.dsp.focus({ workspace = 1 })")
      #     { description = "切换到工作区1"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + End"
      #     (mkLuaInlineViaExecCmd "blast-switch-last-workspace -m workspace")
      #     { description = "切换到最后一个工作区"; }
      #   ];
      # }
      # 切换到工作区 (Mod+1-9 — same as niri)
      # {
      #   _args = [
      #     "${mod} + 1"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '1' })")
      #     { description = "切换到工作区1"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 2"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '2' })")
      #     { description = "切换到工作区2"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 3"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '3' })")
      #     { description = "切换到工作区3"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 4"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '4' })")
      #     { description = "切换到工作区4"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 5"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '5' })")
      #     { description = "切换到工作区5"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 6"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '6' })")
      #     { description = "切换到工作区6"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 7"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '7' })")
      #     { description = "切换到工作区7"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 8"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '8' })")
      #     { description = "切换到工作区8"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + 9"
      #     (mkLuaInline "hl.dsp.focus({ workspace = '9' })")
      #     { description = "切换到工作区9"; }
      #   ];
      # }
      # 工作区移动
      # {
      #   _args = [
      #     "${mod} + SHIFT + Prior"
      #     (mkLuaInline "hl.dsp.move({ workspace = 'r-1' })")
      #     { description = "移动到上一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + Next"
      #     (mkLuaInline "hl.dsp.move({ workspace = 'r+1' })")
      #     { description = "移动到下一个工作区"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + Home"
      #     (mkLuaInline "hl.dsp.move({ workspace = '1' })")
      #     { description = "移动到工作区1"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + End"
      #     (mkLuaInlineViaExecCmd "blast-switch-last-workspace -m split-window-move-workspace")
      #     { description = "移动到最后一个工作区"; }
      #   ];
      # }
      # 移动到工作区 (Mod+Shift+1-9 — same as niri)
      # {
      #   _args = [
      #     "${mod} + SHIFT + 1"
      #     (mkLuaInline "hl.dsp.move({ workspace = '1' })")
      #     { description = "移动到工作区1"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 2"
      #     (mkLuaInline "hl.dsp.move({ workspace = '2' })")
      #     { description = "移动到工作区2"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 3"
      #     (mkLuaInline "hl.dsp.move({ workspace = '3' })")
      #     { description = "移动到工作区3"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 4"
      #     (mkLuaInline "hl.dsp.move({ workspace = '4' })")
      #     { description = "移动到工作区4"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 5"
      #     (mkLuaInline "hl.dsp.move({ workspace = '5' })")
      #     { description = "移动到工作区5"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 6"
      #     (mkLuaInline "hl.dsp.move({ workspace = '6' })")
      #     { description = "移动到工作区6"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 7"
      #     (mkLuaInline "hl.dsp.move({ workspace = '7' })")
      #     { description = "移动到工作区7"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 8"
      #     (mkLuaInline "hl.dsp.move({ workspace = '8' })")
      #     { description = "移动到工作区8"; }
      #   ];
      # }
      # {
      #   _args = [
      #     "${mod} + SHIFT + 9"
      #     (mkLuaInline "hl.dsp.move({ workspace = '9' })")
      #     { description = "移动到工作区9"; }
      #   ];
      # }
      # 鼠标绑定 ✅
      {
        _args = [
          "${mod} + mouse:272"
          (mkLuaInline "hl.dsp.window.drag()")
          {
            mouse = true;
            description = "拖拽窗口";
          }
        ];
      }
      {
        _args = [
          "${mod} + mouse:273"
          (mkLuaInline "hl.dsp.window.resize()")
          {
            mouse = true;
            description = "缩放窗口";
          }
        ];
      }
      # 锁定状态绑定
      {
        _args = [
          "XF86AudioMute"
          (mkLuaInlineViaExecCmd "${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
          {
            locked = true;
            description = "声音关闭/打开";
          }
        ];
      }
      # 持续性操作 (如音量、亮度调节) 需brightnessctl,wireplumber
      # 声音调整 ✅
      {
        _args = [
          "XF86AudioRaiseVolume"
          (mkLuaInlineViaExecCmd "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")
          {
            locked = true;
            repeating = true;
            description = "音量增加";
          }
        ];
      }
      {
        _args = [
          "XF86AudioLowerVolume"
          (mkLuaInlineViaExecCmd "${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
          {
            # locked = true;
            repeating = true;
            description = "音量减少";
          }
        ];
      }
      # 亮度调整 ✅
      {
        _args = [
          "XF86MonBrightnessUp"
          (mkLuaInlineViaExecCmd "${pkgs.brightnessctl}/bin/brightnessctl -d *backlight* set 5%+")
          {
            locked = true;
            repeating = true;
            description = "亮度增加";
          }
        ];
      }
      {
        _args = [
          "XF86MonBrightnessDown"
          (mkLuaInlineViaExecCmd "${pkgs.brightnessctl}/bin/brightnessctl -d *backlight* set 5%-")
          {
            locked = true;
            repeating = true;
            description = "亮度减少";
          }
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
