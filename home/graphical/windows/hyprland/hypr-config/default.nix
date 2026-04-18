{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./plugins # 插件
    ./keybinding # 按键绑定
    ./workspace # 工作空间
    ./window # 窗口
    ./animations # 动画
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };

    settings = {
      exec-once = [ ];

      monitor = [
        ", preferred, auto, 1"
      ];
      # General
      # https://wiki.hypr.land/Configuring/Variables/#general
      general = {
        border_size = 2;
        gaps_in = 2;
        gaps_out = 6;
        "col.inactive_border" = "rgba(595959aa)";
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 0.8;
        inactive_opacity = 0.9;
        fullscreen_opacity = 0.8;
      };

      layerrule = [
        "blur on, match:namespace wofi"
        "ignore_alpha 0.5, match:namespace wofi"
      ];
    };
    extraConfig = ''
      # window resize
      bind = $mod, R, submap, resize

      submap = resize
      binde = , Up, resizeactive, 0 -20
      binde = , Down, resizeactive, 0 20
      binde = , Left, resizeactive, -20 0
      binde = , Right, resizeactive, 20 0
      bind = , escape, submap, reset
      bind = , catchall, submap, reset
      submap = reset
    '';
  };
}
