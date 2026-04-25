{
  config,
  lib,
  pkgs,
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
    "$launchCalculator" = "pkill qalculate-gtk || qalculate-gtk";
    "$launchBrowser" = "google-chrome";
    "$launchIde" = "code";
    "$appLauncher" = "pkill wofi || wofi";
    "$lockScreen" = "blast-lock-screen";
    "$pickColor" = "hyprpicker -a -n -s 5 -u 60";
    "$helpKeybinding" = "hyprkcs";
    "$toggleWaybar" = "blast-toggle-waybar";
    binds = {
      drag_threshold = 10;
    };

    # NOTE:
    # `Super` + `A`: 显示工作区和应用启动器概览(hyprshell支持)
    # `Alt` + `Tab`: 切换应用程序(hyprshell支持)
    bind = [
      "CTRL ALT, Delete, exec, blast-shutdown logout" # 注销当前用户会话/退出桌面
      "$mod ALT, M, exec, blast-shutdown reboot" # 重启系统
      "$mod ALT, C, exec, $pickColor" # 启动提取颜色

      # 系统
      "$mod, L, exec, $lockScreen" # 锁定屏幕
      "$mod, H, exec, $toggleWaybar" # 隐藏/显示waybar
      # "$mod, P, pseudo" # Dwindle: 伪平铺
      # "$mod, J, togglesplit" # Dwindle: 切换横纵分割
      # "$mod, G, togglegroup" # 窗口成组
      # "$mod, L, lockactivegroup, toggle" # 锁定组

      # 截图
      # 活动窗口截图
      "ALT, Print, exec, blast-screenshot active"
      # 全屏截图
      "Shift, Print, exec, blast-screenshot full"
      # 交互式截图
      ", Print, exec, blast-screenshot region"
      # 交互式截图+标注
      "$mod, Print, exec, blast-screenshot annotate"

      # 应用
      "$mod, T, exec, $launchTerminal" # 启动终端
      "$mod, E, exec, $launchFileManager" # 启动文件管理器
      "$mod, C, exec, $launchCalculator" # 启动计算器
      "$mod, B, exec, $launchBrowser" # 启动浏览器
      "$mod, P, exec, $launchIde" # 启动IDE
      # "$mod, Return, global, com.mitchellh.ghostty:toggle_quick_terminal" # 切换到下拉终端
      "$mod, Return, exec, $launchDropdownTerminal"
      "$mod, slash, exec, $appLauncher" # 启动应用启动器
      "$mod, F1, exec, $helpKeybinding" # 启动帮助按键绑定

      # 布局
      "$mod, bracketleft, layoutmsg, cycleprev" # 切换到上一个窗口
      "$mod, bracketright, layoutmsg, cyclenext" # 切换到下一个窗口

      # 窗口管理
      "$mod, Q, killactive" # 关闭窗口
      "$mod, F, fullscreen, 0" # 切换全屏模式(不保留状态栏)
      "$mod, M, fullscreen, 1" # 切换最大化模式(保留状态栏)
      "$mod, V, togglefloating," # 切换浮动窗口
      "$mod, Tab, cyclenext" # 切换到下一个窗口
      # 聚焦窗口 (Mod+Arrow — same as niri)
      "$mod, Left, movefocus, l"
      "$mod, Right, movefocus, r"
      "$mod, Up, movefocus, u"
      "$mod, Down, movefocus, d"
      # 移动窗口 (Mod+Shift+Arrow — same as niri)
      "$mod SHIFT, Left, movewindow, l"
      "$mod SHIFT, Right, movewindow, r"
      "$mod SHIFT, Up, movewindow, u"
      "$mod SHIFT, Down, movewindow, d"

      # 工作区管理
      "$mod, 0, split:grabroguewindows"
      # https://github.com/shezdy/hyprsplit
      # 工作区切换
      "$mod, mouse_down, split:workspace, r-1" # 鼠标滚轮
      "$mod, mouse_up, split:workspace, r+1" # 鼠标滚轮
      "$mod, Prior, split:workspace, r-1" # Prior = PageUp 切换到上一个工作区
      "$mod, Next, split:workspace, r+1" # Next = PageDown 切换到下一个工作区
      "$mod, Home, split:workspace, 1"
      "$mod, End, exec, blast-switch-last-workspace split-workspace"
      # 切换到工作区 (Mod+1-9 — same as niri)
      "$mod, 1, split:workspace, 1"
      "$mod, 2, split:workspace, 2"
      "$mod, 3, split:workspace, 3"
      "$mod, 4, split:workspace, 4"
      "$mod, 5, split:workspace, 5"
      "$mod, 6, split:workspace, 6"
      "$mod, 7, split:workspace, 7"
      "$mod, 8, split:workspace, 8"
      "$mod, 9, split:workspace, 9"
      # 工作区移动
      "$mod SHIFT, Prior, split:movetoworkspace, r-1" # Prior = PageUp 移动到上一个工作区
      "$mod SHIFT, Next, split:movetoworkspace, r+1" # Next = PageDown 移动到下一个工作区
      "$mod SHIFT, Home, split:movetoworkspace, 1"
      "$mod SHIFT, End, exec, blast-switch-last-workspace split-movetoworkspace"
      # 移动到工作区 (Mod+Shift+1-9 — same as niri)
      "$mod SHIFT, 1, split:movetoworkspace, 1"
      "$mod SHIFT, 2, split:movetoworkspace, 2"
      "$mod SHIFT, 3, split:movetoworkspace, 3"
      "$mod SHIFT, 4, split:movetoworkspace, 4"
      "$mod SHIFT, 5, split:movetoworkspace, 5"
      "$mod SHIFT, 6, split:movetoworkspace, 6"
      "$mod SHIFT, 7, split:movetoworkspace, 7"
      "$mod SHIFT, 8, split:movetoworkspace, 8"
      "$mod SHIFT, 9, split:movetoworkspace, 9"

      /*
        # 工作区管理
        # 工作区切换
          "$mod, mouse_down, workspace, e-1" # 鼠标滚轮
          "$mod, mouse_up, workspace, e+1" # 鼠标滚轮
          "$mod, Prior, workspace, e-1" # Prior = PageUp 切换到上一个工作区
          "$mod, Next, workspace, e+1" # Next = PageDown 切换到下一个工作区
          "$mod, Home, workspace, 1"
          "$mod, End, exec, blast-switch-last-workspace workspace"
        # 切换到工作区 (Mod+1-9 — same as niri)
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
        # 工作区移动
          "$mod SHIFT, Prior, movetoworkspace, e-1" # Prior = PageUp 移动到上一个工作区
          "$mod SHIFT, Next, movetoworkspace, e+1" # Next = PageDown 移动到下一个工作区
          "$mod SHIFT, Home, movetoworkspace, 1"
          "$mod SHIFT, End, exec, blast-switch-last-workspace movetoworkspace"
        # 移动到工作区 (Mod+Shift+1-9 — same as niri)
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
      */
    ];
    bindm = [
      "$mod, mouse:272, movewindow" # Super + 左键 拖拽窗口
      "$mod, mouse:273, resizewindow" # Super + 右键 缩放窗口
    ];
    bindl = [
      # 声音关闭/打开
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];
    # 持续性操作 (如音量、亮度调节) 需brightnessctl,wireplumber
    bindel = [
      # 声音调整
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      # 亮度调整
      ", XF86MonBrightnessUp, exec, brightnessctl -d *backlight* set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -d *backlight* set 5%-"
      # 蓝光调整
      # ", XF86MonBrightnessDown, exec, hyprctl hyprsunset gamma -10"
      # ", XF86MonBrightnessUp, exec, hyprctl hyprsunset gamma +10"
    ];
  };
}
