{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 应用启动器
  # https://wiki.hypr.land/Useful-Utilities/App-Launchers/

  # wofi 极致简约原生
  # https://cloudninja.pw/docs/wofi.html

  # rofi 极致视觉效果
  # https://github.com/davatorium/rofi 仓库
  # https://github.com/adi1090x/rofi 主题

  programs.wofi = {
    enable = true;
    settings = {
      # man 5 wofi
      show = "drun";
      location = "center";
      width = "40%";
      height = "40%";
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";

      prompt = "Search...";
      filter_rate = 100;

      allow_images = true;
      allow_markup = true;
      no_actions = true;
      insensitive = true;
      gtk_dark = true;
    };
    style = builtins.readFile ./wofi/style.gtk.css;
  };
}
