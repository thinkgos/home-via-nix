{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Niri 窗口规则
  programs.niri.settings.window-rules = [
    # 所有窗口规则
    {
      opacity = 0.97;
      geometry-corner-radius = {
        top-left = 10.0;
        top-right = 10.0;
        bottom-left = 10.0;
        bottom-right = 10.0;
      };
      clip-to-geometry = true;
      draw-border-with-background = false;
    }

    # 截图标注/压缩工具
    {
      matches = [
        { app-id = "^flameshot$"; }
        { app-id = ''^org\.kde\.ark$''; }
      ];
      open-floating = true;
    }
    # 在终端使用ueberzugpp显示图片
    {
      matches = [
        { app-id = "^ueberzugpp_.*$"; }
      ];
      open-floating = true;
      open-focused = false;
    }
    # 计算器/网络/蓝牙/音频
    {
      matches = [
        { app-id = "^qalculate-gtk$"; }
        { app-id = "^nm-connection-editor$"; }
        { app-id = "^blueman-manager-wrapped$"; }
        { app-id = ''^org\.pulseaudio\.pavucontrol$''; }
        { app-id = ''^org\.fcitx$''; }
      ];
      open-floating = true;
      default-column-width = {
        fixed = 750;
      };
      default-window-height = {
        fixed = 480;
      };
    }
    # 文件/邮件/监控/vlc/cc-switch/clash-verge/磁盘/磁盘分析工具
    {
      matches = [
        { app-id = "^nemo$"; }
        { app-id = ''^io\.missioncenter\.MissionCenter$''; }
        { app-id = "^vlc$"; }
        { app-id = "^cc-switch$"; }
        { app-id = "^clash-verge$"; }
        { app-id = "^gnome-disks$"; }
        { app-id = ''^org\.gnome\.baobab$''; }
        { app-id = ''^com\.github\.tchx84\.Flatseal$''; }
      ];
      open-floating = true;
      default-column-width = {
        proportion = 0.6;
      };
      default-window-height = {
        proportion = 0.6;
      };
    }
    # LocalSend
    {
      matches = [
        { app-id = "^localsend_app$"; }
      ];
      open-floating = true;
      default-column-width = {
        fixed = 720;
      };
      default-window-height = {
        fixed = 800;
      };
    }
    # 图片预览/截图标注
    {
      matches = [
        { app-id = ''^com\.gabm\.satty$''; }
        { app-id = ''^org\.kde\.gwenview$''; }
      ];
      open-floating = true;
      default-column-width = {
        proportion = 0.8;
      };
      default-window-height = {
        proportion = 0.8;
      };
    }
    # 下拉式终端窗口规则
    {
      matches = [
        { app-id = "^dropdown-terminal$"; }
      ];
      open-floating = true;
      open-on-output = "current";
      default-column-width = {
        proportion = 1.0;
      };
      default-window-height = {
        proportion = 0.4;
      };
      default-floating-position = {
        x = 0;
        y = 0;
        relative-to = "top-left";
      };
      geometry-corner-radius = {
        top-left = 0.0;
        top-right = 0.0;
        bottom-left = 0.0;
        bottom-right = 0.0;
      };
    }
    # 浮动终端窗口规则
    {
      matches = [
        { app-id = "^floating-terminal$"; }
      ];
      open-floating = true;
      default-column-width = {
        fixed = 650;
      };
      default-window-height = {
        fixed = 350;
      };
      default-floating-position = {
        x = 20;
        y = 40;
        relative-to = "top-right";
      };
    }
    # 交互式录屏
    {
      matches = [
        { app-id = ''^io\.github\.seadve\.Kooha$''; }
      ];
      default-column-width = {
        fixed = 230;
      };
      default-window-height = {
        fixed = 230;
      };
    }
    # 浏览器, 在全屏时启用不透明
    # {
    #   matches = [
    #     {
    #       app-id = "^google-chrome$";
    #       is-focused = true;
    #     }
    #     {
    #       app-id = "^firefox$";
    #       is-focused = true;
    #     }
    #   ];
    #   opacity = 1.0;
    # }
  ];
}
