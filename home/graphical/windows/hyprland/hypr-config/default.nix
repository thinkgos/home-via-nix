{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./plugins # 插件
    ./keybinding.nix # 按键绑定
    ./monitor.nix # 显示器
    ./workspace.nix # 工作空间
    ./window.nix # 窗口
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
      "$font" = "FiraCode Nerd Font Mono";
      exec-once = [ ];
      # General
      # https://wiki.hypr.land/Configuring/Variables/#general
      general = {
        border_size = 2;
        gaps_in = 1;
        gaps_out = 2;
        float_gaps = 5;
        "col.inactive_border" = "rgba(595959aa)";
        "col.active_border" = "rgba(33ccffee) rgba(6c71ffee) rgba(00ff99ee) 45deg"; # 天蓝/靛紫色/翠绿
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 0.92;
        inactive_opacity = 0.95;
        fullscreen_opacity = 0.92;
        dim_modal = true;
        # dim_inactive = true;
      };
      misc = {
        disable_splash_rendering = true;
        font_family = "$font";
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
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
