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
    monitor-primary = "eDP-1";
    monitor-secondary = "";
  };
  components = [
    "flameshot"
  ];
  apps = [
    "obs-studio"
  ];
}
