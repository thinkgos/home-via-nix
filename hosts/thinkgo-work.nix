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
      monitor-primary = "HDMI-A-1";
      monitor-secondary = "DP-1";
    };
    components = [
      "lan-mouse-client"
    ];
    apps = [
      "obs-studio"
    ];
  }
