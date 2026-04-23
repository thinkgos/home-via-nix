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
      # 文件/邮件/监控/vlc/cc-switch/clash-verge
      "float on, size monitor_w*0.6 monitor_h*0.6, center on, match:class ^(nemo|thunderbird|io.missioncenter.MissionCenter|vlc|cc-switch|clash-verge)$"
      # LocalSend
      "float on, size 720 800, move (monitor_w-720)*0.5 100, match:class ^(localsend_app)$"
      # 截图标注
      "float on, size monitor_w*0.8 monitor_h*0.8, center on, match:class ^(com.gabm.satty)$"
      # 下拉式终端窗口规则
      "float on,  size monitor_w monitor_h*0.4, move 0 0, rounding 0, workspace special:dropdown-terminal, match:class ^(dropdown-terminal)$"

      # 全屏时, 关闭屏幕休眠, 启用不透明.
      # NOTE:
      # 目前不支持同时满足全屏和指定应用的规则
      # match:fullscreen 这个最大化和全屏都认为是fullscreen.
      # 全屏时, 进入空闲抑制
      "idle_inhibit fullscreen, match:fullscreen_state_client 2"
      "idle_inhibit fullscreen, match:fullscreen_state_internal 2"

      # 浏览器, 在全屏时启用不透明
      "opaque on, match:fullscreen_state_client 2, match:class ^(google-chrome|firefox)$"
      "opaque on, match:fullscreen_state_internal 2, match:class ^(google-chrome|firefox)$"
    ];
  };
}
