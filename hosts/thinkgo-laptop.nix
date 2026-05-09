{ lib, pkgs }:
lib.recursiveUpdate
  (import ./preset.nix {
    inherit lib;
    inherit pkgs;
  })
  {
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
