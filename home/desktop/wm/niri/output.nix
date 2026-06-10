{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Niri 显示器
  programs.niri.settings.outputs = {
    "${customize.desktop.monitor-primary}" = {
      enable = true;
      # mode = lib.mkDefault { };
      scale = 1.0;
      position = {
        x = 0;
        y = 0;
      };
      focus-at-startup = true;
      background-color = "#6c6c6cee";
      transform = {
        flipped = false;
        rotation = 0;
      };
      # hot-corner = ["top-left"];
    };

  }
  // lib.optionalAttrs (customize.desktop.monitor-secondary != "") {
    "${customize.desktop.monitor-secondary}" = {
      enable = true;
      # mode = lib.mkDefault { };
      scale = 1.0;
      position = {
        x = -1920;
        y = 0;
      };
      focus-at-startup = false;
      background-color = "#3c3c3cee";
      transform = {
        flipped = false;
        rotation = 0;
      };
      # hot-corner =[ "top-left"];
    };
  };
}
