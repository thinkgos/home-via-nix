{ lib, pkgs }:
lib.recursiveUpdate (import ./preset.nix { inherit lib pkgs; }) {
  username = "thinkgo";
  desktop = {
    window = "hyprland";
    window-version = "hyprland";
    monitor-primary = "eDP-1";
    monitor-secondary = "";
  };
  components = [ ];
  apps = [
    "obs-studio"
  ];
  lang = [
    "go"
    "rust"
    "python"
  ];
}
