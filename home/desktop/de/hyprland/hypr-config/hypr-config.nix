{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./animations/animations.nix # 动画
    ./plugins/plugins.nix # 插件
    ./keybinding.nix # 按键绑定
    ./monitor.nix # 显示器
    ./workspace.nix # 工作空间
    ./window.nix # 窗口
  ];

  wayland.windowManager.hyprland = {
    settings = {
      "$font" = "JetBrainsMono Nerd Font Mono";
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
      input = {
        sensitivity = 0.5;
        accel_profile = "adaptive";
        follow_mouse = 0;
      };
      group = {
        auto_group = true;
        insert_after_current = true;
        focus_removed_window = true;
        drag_into_group = 1;
        merge_groups_on_drag = true;
        merge_groups_on_groupbar = true;
        merge_floated_into_tiled_on_groupbar = false;
        group_on_movetoworkspace = false;
        "col.border_active" = "rgba(b4befeee) rgba(cba6f7ee) rgba(6c71ffee) 45deg";
        "col.border_inactive" = "rgba(313244aa)";
        "col.border_locked_active" = "rgba(f9e2afee) rgba(fab387ee) rgba(f38ba8ee) 45deg";
        "col.border_locked_inactive" = "rgba(45475aaa)";
        groupbar = {
          enabled = true;
          font_family = "$font";
          font_size = 11;
          font_weight_active = "bold";
          font_weight_inactive = "normal";
          gradients = false;
          height = 14;
          indicator_gap = 2;
          indicator_height = 3;
          stacked = false;
          priority = 3;
          render_titles = true;
          text_padding = 2;
          scrolling = true;
          rounding = 2;
          rounding_power = 2.0;
          gradient_rounding = 2;
          gradient_rounding_power = 2.0;
          round_only_edges = true;
          gradient_round_only_edges = true;
          text_color = "rgba(cdd6f4ee)";
          "col.active" = "rgba(89b4faee)";
          "col.inactive" = "rgba(1e1e2eaa)";
          "col.locked_active" = "rgba(89b4faee)";
          "col.locked_inactive" = "rgba(1e1e2eaa)";
          gaps_in = 2;
          gaps_out = 2;
          keep_upper_gap = true;
          blur = true;
        };
      };
      misc = {
        disable_hyprland_logo = false;
        disable_splash_rendering = false;
        disable_scale_notification = false;
        force_default_wallpaper = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        font_family = "$font";
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
      debug = {
        disable_logs = true;
        disable_time = true;
      };
      dwindle = {
        force_split = 0;
        preserve_split = true;
        smart_split = false;
      };
    };
    extraConfig = ''
      # window resize
      bindd = $mod ALT, R, 缩放窗口, submap, resize

      submap = resize
      binde = , Up, resizeactive, 0 -20
      binde = , Down, resizeactive, 0 20
      binde = , Left, resizeactive, -20 0
      binde = , Right, resizeactive, 20 0
      bind = , escape, submap, reset
      bind = , catchall, submap, reset
      submap = reset

      source = ~/.config/hypr/hyprland-extra.conf
    '';
  };
  # 创建默认配置文件，如果不存在
  home.activation.create-hyprland-config-extra = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    file=${config.xdg.configHome}/hypr/hyprland-extra.conf
    if [ ! -f "$file" ]; then
      mkdir -p "$(dirname "$file")"
      touch "$file"
    fi
  '';
}
