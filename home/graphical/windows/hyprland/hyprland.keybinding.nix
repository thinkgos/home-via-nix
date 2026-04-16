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
    "$terminal" = "ghostty";
    "$fileManager" = "nautilus --new-window";
    "$launchBrowser" = "xdg-open https://google.com";
    "$appLauncher" = "pkill wofi || wofi";
    "$lockScreen" = "hyprlock";
    "$pickColor" = "hyprpicker -a -n -s 5 -u 60";
    bind = [
      # 系统 注销中
      "$mod, L, exec, $lockScreen" # 锁定屏幕
      ''CTRL ALT, Delete, exec, zenity --question --text="确定要登出 $USER 吗？" && hyprshutdown -t "注销中..."'' # 注销当前用户会话
      "$mod ALT, M, exit" # 退出桌面
      # "$mod, P, pseudo" # Dwindle: 伪平铺
      # "$mod, J, togglesplit" # Dwindle: 切换横纵分割
      # "$mod, G, togglegroup" # 窗口成组
      # "$mod, L, lockactivegroup, toggle" # 锁定组
      # "$mod, , hyprexpo:expo, toggle" # 显示概览

      # 截图
      ", Print, exec, flameshot gui < /dev/null" # 截图
      # ", Print, exec, grim -g \"$(slurp)\" - | wl-copy" # 截图

      # 应用
      "$mod, T, exec, $terminal" # 启动终端
      "$mod, E, exec, $fileManager" # 启动文件管理器
      "$mod, C, exec, qalculate-gtk" # 启动计算器
      "$mod, B, exec, $launchBrowser" # 启动浏览器
      "$mod, semicolon, exec, $appLauncher" # 启动应用启动器
      "$mod ALT, C, exec, $pickColor" # 启动提取颜色

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
      # 工作区切换
      "$mod, mouse_down, workspace, e-1" # 鼠标滚轮
      "$mod, mouse_up, workspace, e+1" # 鼠标滚轮
      "$mod, Prior, workspace, e-1" # Prior = PageUp 切换到上一个工作区
      "$mod, Next, workspace, e+1" # Next = PageDown 切换到下一个工作区
      "$mod, Home, workspace, 1"
      "$mod, End, exec, hyprctl dispatch workspace $(hyprctl workspaces | grep 'workspace ID' | awk '{print $3}' | sort -n | tail -n 1)"
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
      "$mod SHIFT, End, exec, hyprctl dispatch movetoworkspace $(hyprctl workspaces | grep 'workspace ID' | awk '{print $3}' | sort -n | tail -n 1)"
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
    ];
    bindm = [
      "$mod, mouse:272, movewindow" # Super + 左键 拖拽窗口
      "$mod, mouse:273, resizewindow" # Super + 右键 缩放窗口
    ];
    # 持续性操作 (如音量、亮度调节) 需brightnessctl,wireplumber
    bindel = [
      # 声音调整
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      # 亮度调整
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      # 蓝光调整
      # ", XF86MonBrightnessDown, exec, hyprctl hyprsunset gamma -10"
      # ", XF86MonBrightnessUp, exec, hyprctl hyprsunset gamma +10"
    ];
  };
}
