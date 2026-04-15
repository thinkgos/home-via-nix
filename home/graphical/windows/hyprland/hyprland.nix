{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland.plugins.nix # 插件
    ./hyprland.keybinding.nix # 按键绑定
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
        layout = "dwindle";
      };

      workspace = [
        "r[1-4], persistent:true"
        "r[1-2], layout:dwindle"
        "3, layout:dwindle"
        "4, on-created-empty:$terminal"
      ];

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
