{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Hyprland 键盘绑定
  # https://wiki.hypr.land/Configuring/Binds/
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$launchTerminal" = "alacritty";
    "$launchDropdownTerminal" = "blast-dropdown-terminal";
    "$launchFileManager" = "nemo";
    "$launchCalculator" = "/bin/pkill qalculate-gtk || qalculate-gtk";
    "$launchBrowser" = "google-chrome";
    "$launchIde" = "code";
    "$launchScreenRecorder" = "/bin/pkill kooha || flatpak run io.github.seadve.Kooha";
    "$appLauncher" = "/bin/pkill rofi || rofi -show drun";
    "$lockScreen" = "blast-screen-lock";
    "$helpKeybinding" = "hyprkcs";
    "$toggleWaybar" = "blast-toggle-waybar";
    binds = {
      drag_threshold = 10;
    };

    # NOTE:
    # `Super` + `A`: 显示工作区和应用启动器概览(hyprshell支持)
    # `Alt` + `Tab`: 切换应用程序(hyprshell支持)
    bindd = [
      "CTRL ALT, Delete, 注销当前用户会话/退出桌面, exec, blast-shutdown logout"
      "$mod ALT, M, 重启系统, exec, blast-shutdown reboot"
      "$mod ALT, T, 启动wrap终端, exec, warp-terminal"

      # 系统
      "$mod, L, 锁定屏幕, exec, $lockScreen"
      "$mod, H, 隐藏/显示waybar, exec, $toggleWaybar"
      # "$mod, J, 伪平铺, pseudo" # Dwindle
      # "$mod, J, 切换横纵分割, layoutmsg, togglesplit" # Dwindle
      "$mod, G, 窗口成组, togglegroup,"
      "$mod, Y, 锁定窗口组, lockactivegroup, toggle"

      # 截图/录屏
      "$mod, R, 交互式录屏, exec, $launchScreenRecorder"
      "ALT, Print, 窗口截图, exec, blast-screen window"
      "Shift, Print, 全屏截图, exec, blast-screen fullscreen"
      ", Print, 选框截图, exec, blast-screen region"
      "$mod, Print, 选框截图标注, exec, flameshot gui"

      # 应用
      "$mod, T, 启动终端, exec, $launchTerminal"
      "$mod, E, 启动文件管理器, exec, $launchFileManager"
      "$mod, C, 启动计算器, exec, $launchCalculator"
      "$mod, B, 启动浏览器, exec, $launchBrowser"
      "$mod, P, 启动IDE, exec, $launchIde"
      # "$mod, grave, global, 切换到下拉终端, com.mitchellh.ghostty:toggle_quick_terminal"
      "$mod, grave, 切换到下拉终端, exec, $launchDropdownTerminal"
      "$mod, Return, 启动应用启动器, exec, $appLauncher"
      "$mod, F1, 启动帮助按键绑定, exec, $helpKeybinding"

      # 布局
      "$mod, bracketleft, 切换到上一个窗口, layoutmsg, cycleprev"
      "$mod, bracketright, 切换到下一个窗口, layoutmsg, cyclenext"

      # 窗口管理
      "$mod, Q, 关闭窗口, killactive,"
      "$mod, F, 切换全屏模式(不保留状态栏), fullscreen, 0"
      "$mod, M, 切换最大化模式(保留状态栏), fullscreen, 1"
      "$mod, V, 切换浮动窗口, togglefloating,"
      "$mod, Tab, 切换到下一个窗口, cyclenext,"
      # 聚焦窗口 (Mod+Arrow — same as niri)
      "$mod, Left, 聚焦左边窗口, movefocus, l"
      "$mod, Right, 聚焦右边窗口, movefocus, r"
      "$mod, Up, 聚焦上方窗口, movefocus, u"
      "$mod, Down, 聚焦下方窗口, movefocus, d"
      # 移动窗口 (Mod+Shift+Arrow — same as niri)
      "$mod SHIFT, Left, 移动窗口到左边, movewindow, l"
      "$mod SHIFT, Right, 移动窗口到右边, movewindow, r"
      "$mod SHIFT, Up, 移动窗口到上方, movewindow, u"
      "$mod SHIFT, Down, 移动窗口到下方, movewindow, d"

      # 工作区管理
      "$mod, 0, 收集孤立窗口, split:grabroguewindows,"
      # https://github.com/shezdy/hyprsplit
      # 工作区切换
      "$mod, mouse_down, 鼠标滚轮-上一个工作区, split:workspace, r-1"
      "$mod, mouse_up, 鼠标滚轮-下一个工作区, split:workspace, r+1"
      "$mod, Prior, 切换到上一个工作区, split:workspace, r-1"
      "$mod, Next, 切换到下一个工作区, split:workspace, r+1"
      "$mod, Home, 切换到工作区1, split:workspace, 1"
      "$mod, End, 切换到最后一个工作区, exec, blast-switch-last-workspace split-workspace"
      # 切换到工作区 (Mod+1-9 — same as niri)
      "$mod, 1, 切换到工作区1, split:workspace, 1"
      "$mod, 2, 切换到工作区2, split:workspace, 2"
      "$mod, 3, 切换到工作区3, split:workspace, 3"
      "$mod, 4, 切换到工作区4, split:workspace, 4"
      "$mod, 5, 切换到工作区5, split:workspace, 5"
      "$mod, 6, 切换到工作区6, split:workspace, 6"
      "$mod, 7, 切换到工作区7, split:workspace, 7"
      "$mod, 8, 切换到工作区8, split:workspace, 8"
      "$mod, 9, 切换到工作区9, split:workspace, 9"
      # 工作区移动
      "$mod SHIFT, Prior, 移动到上一个工作区, split:movetoworkspace, r-1"
      "$mod SHIFT, Next, 移动到下一个工作区, split:movetoworkspace, r+1"
      "$mod SHIFT, Home, 移动到工作区1, split:movetoworkspace, 1"
      "$mod SHIFT, End, 移动到最后一个工作区, exec, blast-switch-last-workspace split-movetoworkspace"
      # 移动到工作区 (Mod+Shift+1-9 — same as niri)
      "$mod SHIFT, 1, 移动到工作区1, split:movetoworkspace, 1"
      "$mod SHIFT, 2, 移动到工作区2, split:movetoworkspace, 2"
      "$mod SHIFT, 3, 移动到工作区3, split:movetoworkspace, 3"
      "$mod SHIFT, 4, 移动到工作区4, split:movetoworkspace, 4"
      "$mod SHIFT, 5, 移动到工作区5, split:movetoworkspace, 5"
      "$mod SHIFT, 6, 移动到工作区6, split:movetoworkspace, 6"
      "$mod SHIFT, 7, 移动到工作区7, split:movetoworkspace, 7"
      "$mod SHIFT, 8, 移动到工作区8, split:movetoworkspace, 8"
      "$mod SHIFT, 9, 移动到工作区9, split:movetoworkspace, 9"

      /*
        # 工作区管理
        # 工作区切换
          "$mod, mouse_down, 鼠标滚轮-上一个工作区, workspace, e-1"
          "$mod, mouse_up, 鼠标滚轮-下一个工作区, workspace, e+1"
          "$mod, Prior, 切换到上一个工作区, workspace, e-1" # 切换到上一个工作区
          "$mod, Next, 切换到下一个工作区, workspace, e+1" # Next = PageDown 切换到下一个工作区
          "$mod, Home, 切换到工作区1, workspace, 1"
          "$mod, End, 切换到最后一个工作区, exec, blast-switch-last-workspace workspace"
        # 切换到工作区 (Mod+1-9 — same as niri)
          "$mod, 1, 切换到工作区1, workspace, 1"
          "$mod, 2, 切换到工作区2, workspace, 2"
          "$mod, 3, 切换到工作区3, workspace, 3"
          "$mod, 4, 切换到工作区4, workspace, 4"
          "$mod, 5, 切换到工作区5, workspace, 5"
          "$mod, 6, 切换到工作区6, workspace, 6"
          "$mod, 7, 切换到工作区7, workspace, 7"
          "$mod, 8, 切换到工作区8, workspace, 8"
          "$mod, 9, 切换到工作区9, workspace, 9"
        # 工作区移动
          "$mod SHIFT, Prior, 移动到上一个工作区, movetoworkspace, e-1" # Prior = PageUp 移动到上一个工作区
          "$mod SHIFT, Next, 移动到下一个工作区, movetoworkspace, e+1" # Next = PageDown 移动到下一个工作区
          "$mod SHIFT, Home, 移动到工作区1, movetoworkspace, 1"
          "$mod SHIFT, End, 移动到最后一个工作区, exec, blast-switch-last-workspace movetoworkspace"
        # 移动到工作区 (Mod+Shift+1-9 — same as niri)
          "$mod SHIFT, 1, 移动到工作区1, movetoworkspace, 1"
          "$mod SHIFT, 2, 移动到工作区2, movetoworkspace, 2"
          "$mod SHIFT, 3, 移动到工作区3, movetoworkspace, 3"
          "$mod SHIFT, 4, 移动到工作区4, movetoworkspace, 4"
          "$mod SHIFT, 5, 移动到工作区5, movetoworkspace, 5"
          "$mod SHIFT, 6, 移动到工作区6, movetoworkspace, 6"
          "$mod SHIFT, 7, 移动到工作区7, movetoworkspace, 7"
          "$mod SHIFT, 8, 移动到工作区8, movetoworkspace, 8"
          "$mod SHIFT, 9, 移动到工作区9, movetoworkspace, 9"
      */
    ];
    binddm = [
      "$mod, mouse:272, 拖拽窗口, movewindow" # Super + 左键
      "$mod, mouse:273, 缩放窗口, resizewindow" # Super + 右键
    ];
    binddl = [
      ", XF86AudioMute, 声音关闭/打开, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];
    # 持续性操作 (如音量、亮度调节) 需brightnessctl,wireplumber
    binddle = [
      # 声音调整
      ", XF86AudioRaiseVolume, 音量增加, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, 音量减少, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      # 亮度调整
      ", XF86MonBrightnessUp, 亮度增加, exec, brightnessctl -d *backlight* set 5%+"
      ", XF86MonBrightnessDown, 亮度减少, exec, brightnessctl -d *backlight* set 5%-"
      # 蓝光调整
      # ", XF86MonBrightnessDown, 蓝光减少, exec, hyprctl hyprsunset gamma -10"
      # ", XF86MonBrightnessUp, 蓝光增加, exec, hyprctl hyprsunset gamma +10"
    ];
  };
}
