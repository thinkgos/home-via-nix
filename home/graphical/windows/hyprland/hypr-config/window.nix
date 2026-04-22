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
      "float on,  size 100% 40%, move 0 0, rounding 0, workspace special:dropdown-terminal, match:class ^(dropdown-terminal)$"
    ];
  };
}
