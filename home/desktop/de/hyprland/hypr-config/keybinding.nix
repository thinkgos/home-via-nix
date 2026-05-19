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
  # Hyprland 键盘绑定
  # https://wiki.hypr.land/Configuring/Binds/
  wayland.windowManager.hyprland = {
    settings = {
      # local variable
      mod = {
        _var = "SUPER";
      };
      settingNumWorkspaces = {
        _var = 4; # 最大9
      };
      launchTerminal = {
        _var = "${pkgs.alacritty}/bin/alacritty";
      };
      launchDropdownTerminal = {
        _var = "blast-dropdown-terminal";
      };
      launchFileManager = {
        _var = "${pkgs.nemo}/bin/nemo";
      };
      launchCalculator = {
        _var = "/bin/pkill qalculate-gtk || ${pkgs.qalculate-gtk}/bin/qalculate-gtk";
      };
      launchBrowser = {
        _var = "google-chrome";
      };
      launchIde = {
        _var = "code";
      };
      launchScreenRecorder = {
        _var = "/bin/pkill kooha || flatpak run io.github.seadve.Kooha";
      };
      popupAppLauncher = {
        _var = "/bin/pkill rofi || ${pkgs.rofi}/bin/rofi -show drun";
      };
      popupKeybindingHelp = {
        _var = "hyprkcs";
      };
      actionToggleWaybar = {
        _var = "blast-toggle-waybar";
      };
      actionLockScreen = {
        _var = "blast-screen-lock";
      };

      # NOTE:
      # `Super` + `A`: 显示工作区和应用启动器概览(hyprshell支持)
      # `Alt` + `Tab`: 切换应用程序(hyprshell支持)
      bind = [
        # 系统
        {
          _args = [
            (mkLuaInline ''mod .. " + ALT + Delete"'')
            (mkLuaInline ''hl.dsp.exec_cmd("blast-shutdown logout")'')
            { description = "注销当前用户会话/退出桌面"; }
          ];
        }
        {
          _args = [
            (mkLuaInline ''mod .. " + ALT + M"'')
            (mkLuaInline ''hl.dsp.exec_cmd("blast-shutdown reboot")'')
            { description = "重启系统"; }
          ];
        }
        # 窗口 resize 子映射
        {
          _args = [
            (mkLuaInline ''mod .. " + ALT + R"'')
            (mkLuaInline ''hl.dsp.submap("resize")'')
          ];
        }

        {
          _args = [
            (mkLuaInline ''mod .. " + ALT + T"'')
            (mkLuaInline ''hl.dsp.exec_cmd("warp-terminal")'')
            { description = "启动wrap终端"; }
          ];
        }
        {
          _args = [
            (mkLuaInline ''mod .. " + L"'')
            (mkLuaInline "hl.dsp.exec_cmd(actionLockScreen)")
            { description = "锁定屏幕"; }
          ];
        }
        {
          _args = [
            (mkLuaInline ''mod .. " + H"'')
            (mkLuaInline "hl.dsp.exec_cmd(actionToggleWaybar)")
            { description = "隐藏/显示waybar"; }
          ];
        }
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

        # 截图/录屏
        {
          _args = [
            (mkLuaInline ''mod .. " + R"'')
            (mkLuaInline "hl.dsp.exec_cmd(launchScreenRecorder)")
            { description = "交互式录屏"; }
          ];
        }
        {
          _args = [
            "ALT + Print"
            (mkLuaInline ''hl.dsp.exec_cmd("blast-screen window")'')
            { description = "窗口截图"; }
          ];
        }
        {
          _args = [
            "SHIFT + Print"
            (mkLuaInline ''hl.dsp.exec_cmd("blast-screen fullscreen")'')
            { description = "全屏截图"; }
          ];
        }
        {
          _args = [
            "Print"
            (mkLuaInline ''hl.dsp.exec_cmd("blast-screen region")'')
            { description = "选框截图"; }
          ];
        }
        {
          _args = [
            (mkLuaInline ''mod .. " + Print"'')
            (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.flameshot}/bin/flameshot gui")'')
            { description = "选框截图标注"; }
          ];
        }

        # 应用
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
            (mkLuaInline ''mod .. " + Return"'')
            (mkLuaInline "hl.dsp.exec_cmd(popupAppLauncher)")
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
            (mkLuaInline ''mod .. " + F"'')
            (mkLuaInline ''hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })'')
            { description = "切换全屏模式(不保留状态栏)"; }
          ];
        }
        {
          _args = [
            (mkLuaInline ''mod .. " + M"'')
            (mkLuaInline ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })'')
            { description = "切换最大化模式(保留状态栏)"; }
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
            (mkLuaInline ''mod .. " + Tab"'')
            (mkLuaInline "hl.dsp.window.cycle_next()")
            { description = "切换到下一个窗口"; }
          ];
        }
        # 聚焦窗口 (Mod+Arrow — same as niri) ✅
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
        # 移动窗口 (Mod+Shift+Arrow — same as niri) ✅
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

        # 工作区管理
        # https://github.com/shezdy/hyprsplit
        # 工作区切换
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + mouse_down"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = 'r-1' })")
        #     { description = "鼠标滚轮-上一个工作区"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + mouse_up"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = 'r+1' })")
        #     { description = "鼠标滚轮-下一个工作区"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + Prior"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = 'r-1' })")
        #     { description = "切换到上一个工作区"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + Next"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = 'r+1' })")
        #     { description = "切换到下一个工作区"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + Home"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = 1 })")
        #     { description = "切换到工作区1"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + End"'')
        #     (mkLuaInlineViaExecCmd "blast-switch-last-workspace -m workspace")
        #     { description = "切换到最后一个工作区"; }
        #   ];
        # }
        # 切换到工作区 (Mod+1-9 — same as niri)
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 1"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '1' })")
        #     { description = "切换到工作区1"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 2"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '2' })")
        #     { description = "切换到工作区2"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 3"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '3' })")
        #     { description = "切换到工作区3"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 4"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '4' })")
        #     { description = "切换到工作区4"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 5"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '5' })")
        #     { description = "切换到工作区5"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 6"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '6' })")
        #     { description = "切换到工作区6"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 7"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '7' })")
        #     { description = "切换到工作区7"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 8"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '8' })")
        #     { description = "切换到工作区8"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + 9"'')
        #     (mkLuaInline "hl.dsp.focus({ workspace = '9' })")
        #     { description = "切换到工作区9"; }
        #   ];
        # }
        # 工作区移动
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + Prior"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = 'r-1' })")
        #     { description = "移动到上一个工作区"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + Next"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = 'r+1' })")
        #     { description = "移动到下一个工作区"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + Home"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '1' })")
        #     { description = "移动到工作区1"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + End"'')
        #     (mkLuaInlineViaExecCmd "blast-switch-last-workspace -m split-window-move-workspace")
        #     { description = "移动到最后一个工作区"; }
        #   ];
        # }
        # 移动到工作区 (Mod+Shift+1-9 — same as niri)
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 1"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '1' })")
        #     { description = "移动到工作区1"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 2"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '2' })")
        #     { description = "移动到工作区2"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 3"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '3' })")
        #     { description = "移动到工作区3"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 4"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '4' })")
        #     { description = "移动到工作区4"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 5"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '5' })")
        #     { description = "移动到工作区5"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 6"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '6' })")
        #     { description = "移动到工作区6"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 7"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '7' })")
        #     { description = "移动到工作区7"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 8"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '8' })")
        #     { description = "移动到工作区8"; }
        #   ];
        # }
        # {
        #   _args = [
        #     (mkLuaInline ''mod .. " + SHIFT + 9"'')
        #     (mkLuaInline "hl.dsp.move({ workspace = '9' })")
        #     { description = "移动到工作区9"; }
        #   ];
        # }
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
        # 锁定状态绑定
        {
          _args = [
            "XF86AudioMute"
            (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')
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
            (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'')
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
            (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')
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
            (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.brightnessctl}/bin/brightnessctl -d *backlight* set 5%+")'')
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
            (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.brightnessctl}/bin/brightnessctl -d *backlight* set 5%-")'')
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
    # https://github.com/shezdy/hyprsplit
    # hyprsplit 插件配置通过 extraConfig 设置
    extraConfig = ''
       -- hyprsplit 插件配置
       hl.plugin.hyprsplit = require("hyprsplit")
       local hs = hl.plugin.hyprsplit

       -- 配置工作区数量
       hs.config( { num_workspaces = settingNumWorkspaces } )

       -- 收集孤立窗口
       hl.bind(mod .. "+ 0", hs.dsp.grab_rogue_windows())
       -- 工作区切换
       hl.bind(mod .. "+ mouse_down", hs.dsp.focus({ workspace = "r-1" }))
       hl.bind(mod .. "+ mouse_up", hs.dsp.focus({ workspace = "r+1" }))
       hl.bind(mod .. "+ Prior", hs.dsp.focus({ workspace = "r-1" }))
       hl.bind(mod .. "+ Next", hs.dsp.focus({ workspace = "r+1" }))
       hl.bind(mod .. "+ Home", hs.dsp.focus({ workspace = 1 }))
       hl.bind(mod .. "+ End", hl.dsp.exec_cmd("blast-switch-last-workspace -m split-workspace"))
       -- 切换到工作区 (Mod+1-9 — same as niri)
       for i = 1, settingNumWorkspaces do
         hl.bind(mod .. "+ " .. i, hs.dsp.focus({ workspace = i }))
       end
       -- 工作区移动
       hl.bind(mod .. "+ SHIFT + Prior", hs.dsp.window.move({ workspace = "r-1" }))
       hl.bind(mod .. "+ SHIFT + Next", hs.dsp.window.move({ workspace = "r+1" }))
       hl.bind(mod .. "+ SHIFT + Home", hs.dsp.window.move({ workspace = 1 }))
       hl.bind(mod .. "+ SHIFT + End", hl.dsp.exec_cmd("blast-switch-last-workspace -m split-window-move-workspace"))
      -- 移动到工作区 (Mod+Shift+1-9 — same as niri)
       for i = 1, settingNumWorkspaces do
         hl.bind(mod .. "+ SHIFT + " .. i, hs.dsp.window.move({ workspace = i }))
       end
    ''
    + (
      if customize.desktop.monitor-secondary != "" then
        ''hs.monitor_priority({ "${customize.desktop.monitor-primary}", "${customize.desktop.monitor-secondary}" })''
      else
        ''hs.monitor_priority({ "${customize.desktop.monitor-primary}" })''
    );

  };
  xdg.configFile = {
    "hypr/hyprsplit" = {
      source = "${pkgs.hyprsplit}/share/hyprsplit";
      recursive = true;
    };
  };
}
