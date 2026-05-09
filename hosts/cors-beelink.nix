{ lib, pkgs }:
let
  preset = import ./preset.nix {
    inherit lib;
    inherit pkgs;
  };
in
lib.recursiveUpdate preset {
  username = "cors";
  desktop = {
    window = "hyprland";
    window-version = "hyprland";
    monitor-primary = "HDMI-A-1";
    monitor-secondary = "";
  };
  components = [
    "flameshot"
    "video-clip"
    "lan-mouse"
  ];
  apps = [
    "nushell"
    "yt-dlp"
    "wayvnc"
    "sunshine"
  ];
}
