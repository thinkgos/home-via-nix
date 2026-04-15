{
  config,
  lib,
  pkgs,
  ...
}:
{
  # wayland vnc
  # BUG: Fetal error while capturing. Exiting...
  services.wayvnc = {
    enable = true;
    autoStart = true;
    settings = {
      address = "0.0.0.0";
      port = 5900;
    };
  };
}
