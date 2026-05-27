{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland 窗口规则和层规则
  wayland.windowManager.hyprland.settings = {
    # 层规则
    layer_rule = [
      {
        match.namespace = "wofi";
        blur = true;
        ignore_alpha = 0.5;
      }
      {
        match.namespace = "rofi";
        blur = true;
        ignore_alpha = 0.5;
      }
      {
        match.namespace = "vicinae";
        blur = true;
        ignore_alpha = 0;
      }
    ];

    # 窗口规则
    window_rule = [
      # 截图标注/压缩工具
      {
        match.initial_title = "^(flameshot|org.kde.ark)$";
        float = true;
      }
      # 在终端使用ueberzugpp显示图片, 不支持kitty图片显示协议的终端.
      {
        match.class = "^(ueberzugpp_.*)$";
        float = true;
        no_focus = true;
      }
      # 计算器/网络/蓝牙/音频
      {
        match.class = "^(qalculate-gtk|nm-connection-editor|.blueman-manager-wrapped|org.pulseaudio.pavucontrol|org.fcitx.)$";
        float = true;
        size = [
          750
          480
        ];
        move = [
          "(monitor_w-750)*0.5"
          160
        ];
      }
      # 文件/邮件/监控/vlc/cc-switch/clash-verge/磁盘/磁盘分析工具
      {
        match.class = "^(nemo|io.missioncenter.MissionCenter|vlc|cc-switch|clash-verge|gnome-disks|org.gnome.baobab|com.github.tchx84.Flatseal)$";
        float = true;
        size = [
          "monitor_w*0.6"
          "monitor_h*0.6"
        ];
        center = true;
      }
      # LocalSend
      {
        match.class = "^(localsend_app)$";
        float = true;
        size = [
          720
          800
        ];
        move = [
          "(monitor_w-720)*0.5"
          100
        ];
      }
      # 图片预览/截图标注
      {
        match.class = "^(com.gabm.satty|org.kde.gwenview)$";
        float = true;
        size = [
          "monitor_w*0.8"
          "monitor_h*0.8"
        ];
        center = true;
      }
      # 下拉式终端窗口规则
      {
        match.class = "^(dropdown-terminal)$";
        float = true;
        size = [
          "monitor_w"
          "monitor_h*0.4"
        ];
        move = [
          0
          0
        ];
        rounding = 0;
        workspace = "special:dropdown-terminal";
      }
      # 交互式录屏
      {
        match.class = "^(io.github.seadve.Kooha)$";
        size = [
          230
          230
        ];
        move = [
          "(monitor_w-260)*0.5"
          60
        ];
      }
      # 空闲抑制规则 - 全屏时, 进入空闲抑制
      {
        match.fullscreen_state_client = 2;
        idle_inhibit = "fullscreen";
      }
      {
        match.fullscreen_state_internal = 2;
        idle_inhibit = "fullscreen";
      }
      # 浏览器, 在全屏时启用不透明
      {
        match = {
          fullscreen_state_client = 2;
          class = "^(google-chrome|firefox)$";
        };
        opaque = true;
      }
      {
        match = {
          fullscreen_state_internal = 2;
          class = "^(google-chrome|firefox)$";
        };
        opaque = true;
      }
    ];
  };
}
