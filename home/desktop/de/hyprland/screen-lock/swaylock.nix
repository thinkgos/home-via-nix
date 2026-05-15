{
  config,
  pkgs,
  ...
}: {
  # 屏幕锁定
  # https://github.com/swaywm/swaylock
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    settings = {
      # 基本设置
      font = "JetBrainsMono Nerd Font Mono";
      ignore-empty-password = true;
      show-failed-attempts = true;
      grace = 3;
      grace-no-mouse = true;
      grace-no-touch = true;

      # 背景 (从 hyprlock background 转换)
      image = "${config.xdg.dataHome}/wallpapers/scenery/5.jpg";

      # 锁定指示器 (从 hyprlock input-field 转换)
      indicator-radius = 100;
      indicator-thickness = 3;
      inside-color = "000000E6";          # rgba(0,0,0,0.9)
      inside-clear-color = "000000E6";
      inside-ver-color = "000000E6";
      inside-wrong-color = "000000E6";
      key-hl-color = "00FF99EE";          # rgba(00ff99ee)
      bs-hl-color = "FF6633EE";           # rgba(ff6633ee)
      ring-color = "33CCFFEE";            # rgba(33ccffee)
      ring-clear-color = "FF6633EE";      # rgba(ff6633ee)
      ring-ver-color = "33CCFFEE";
      ring-wrong-color = "FF0066EE";      # rgba(ff0066ee)
      line-color = "00000000";
      separator-color = "00000000";
      text-color = "FFFFFFE6";            # rgba(255,255,255,0.9)
      text-clear-color = "FFFFFFE6";
      text-ver-color = "FFFFFFE6";
      text-wrong-color = "FFFFFFE6";

      # 布局
      clock = true;
      indicator-caps-lock = true;
    };
  };
}
