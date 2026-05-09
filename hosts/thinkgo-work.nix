{ lib, pkgs }:
let
  preset = import ./preset.nix {
    inherit lib;
    inherit pkgs;
  };
in
lib.recursiveUpdate preset {
  username = "thinkgo";
  desktop = {
    window = "hyprland";
    window-version = "hyprland";
    monitor-primary = "HDMI-A-1";
    monitor-secondary = "DP-1";
  };
  components = [
    "flameshot"
    "lan-mouse-client"
  ];
  apps = [
    "obs-studio"
  ];
}
