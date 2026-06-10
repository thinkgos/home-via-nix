{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsoverviewbackdrop-color
  programs.niri.settings.overview = {
    backdrop-color = "#4a4a4a";
    workspace-shadow = {
      enable = false;
      color = "#1e1e2eee";
      offset = {
        x = 0;
        y = 10;
      };
      softness = 40;
      spread = 10;
    };
    zoom = 0.4;
  };
}
