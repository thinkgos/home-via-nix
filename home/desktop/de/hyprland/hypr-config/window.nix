{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 窗口
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur on, match:namespace wofi"
      "ignore_alpha 0.5, match:namespace wofi"
    ];
    windowrule = [
      # 计算器/网络/蓝牙/音频
      "float on, size 750 480, move (monitor_w-750)*0.5 160, match:class ^(qalculate-gtk|nm-connection-editor|.blueman-manager-wrapped|org.pulseaudio.pavucontrol|org.fcitx.)$"
      # 文件/邮件/监控/vlc/cc-switch/clash-verge/磁盘/磁盘分析工具
      "float on, size monitor_w*0.6 monitor_h*0.6, center on, match:class ^(nemo|io.missioncenter.MissionCenter|vlc|cc-switch|clash-verge|gnome-disks|org.gnome.baobab|com.github.tchx84.Flatseal)$"
      # LocalSend
      "float on, size 720 800, move (monitor_w-720)*0.5 100, match:class ^(localsend_app)$"
      # 截图标注
      "float on, size monitor_w*0.8 monitor_h*0.8, center on, match:class ^(com.gabm.satty)$"
      # 下拉式终端窗口规则
      "float on,  size monitor_w monitor_h*0.4, move 0 0, rounding 0, workspace special:dropdown-terminal, match:class ^(dropdown-terminal)$"

      # 在终端使用ueberzugpp显示图片, 不支持kitty图片显示协议的终端.
      "float on, no_focus on, match:class ^(ueberzugpp_.*)$"

      # NOTE:
      # 目前不支持同时满足全屏和指定应用的规则
      # match:fullscreen 这个最大化和全屏都认为是fullscreen.

      # 空闲抑制规则

      # 全屏时, 进入空闲抑制
      "idle_inhibit fullscreen, match:fullscreen_state_client 2"
      "idle_inhibit fullscreen, match:fullscreen_state_internal 2"

      # 浏览器, 在全屏时启用不透明
      "opaque on, match:fullscreen_state_client 2, match:class ^(google-chrome|firefox)$"
      "opaque on, match:fullscreen_state_internal 2, match:class ^(google-chrome|firefox)$"
    ];
  };
}
