{
  config,
  lib,
  pkgs,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "ghostty";
    "$fileManager" = "nautilus";
    "$launchBrowser" = "xdg-open https://google.com";
    "$appLauncher" = "pkill wofi || wofi";
    "$lockScreen" = "hyprlock";
    "$pickColor" = "hyprpicker -a -n -s 5 -u 60";
    bind = [
      # 系统
      "$mod SHIFT, M, exit" # 退出桌面
      "$mod, Q, killactive" # 关闭当前活动窗口
      "$mod, F, fullscreen, 0" # 全屏(不保留状态栏)
      "$mod, M, fullscreen, 1" # 最大化(保留状态栏)
      "$mod, V, togglefloating," # 切换浮动窗口
      # "$mod, P, pseudo" # Dwindle: 伪平铺
      # "$mod, J, togglesplit" # Dwindle: 切换横纵分割
      # "$mod, G, togglegroup" # 窗口成组
      # "$mod, L, lockactivegroup, toggle" # 锁定组
      "$mod, Tab, cyclenext" # 切换到下一个窗口
      "$mod, comma, layoutmsg, cycleprev" # 切换到上一个窗口
      "$mod, period, layoutmsg, cyclenext" # 切换到下一个窗口
      ", Print, exec, flameshot gui < /dev/null" # 截图
      # ", Print, exec, grim -g \"$(slurp)\" - | wl-copy" # 截图

      # 应用
      "$mod, L, exec, $lockScreen" # Lock screen
      "$mod, T, exec, $terminal" # 打开终端
      "$mod, E, exec, $fileManager" # 打开文件管理器
      "$mod, B, exec, $launchBrowser" # 打开浏览器
      "$mod, semicolon, exec, $appLauncher" # 打开应用启动器
      "$mod SHIFT, C, exec, $pickColor" # 提取颜色

      # 窗口管理
      # 聚集窗口 (Mod+Arrow — same as niri)
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
      # 切换工作区 (鼠标滚轮)
      "$mod, mouse_down, workspace, e-1"
      "$mod, mouse_up, workspace, e+1"
      "$mod ALT, Left, workspace, e-1"
      "$mod ALT, Right, workspace, e+1"
      # 工作区切换 (Mod+1-5 — same as niri)
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      # 移动到工作区 (Mod+Shift+1-5 — same as niri)
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
