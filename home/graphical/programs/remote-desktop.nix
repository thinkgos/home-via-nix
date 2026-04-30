{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # 远程桌面工具
  home.packages =
    with pkgs;
    [
      # tigervnc
      moonlight-qt
    ]
    ++ lib.optional (customize.graphics.window == "hyprland") sunshine;

  # wayland vnc
  # BUG: Fetal error while capturing. Exiting...
  services.wayvnc = lib.mkIf (customize.graphics.window == "hyprland") {
    enable = true;
    autoStart = true;
    settings = {
      address = "0.0.0.0";
      port = 5900;
    };
  };
}
