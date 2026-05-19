{ lib, pkgs }:
lib.recursiveUpdate (import ./preset.nix { inherit lib pkgs; }) {
  username = "cors";
  desktop = {
    window = "hyprland";
    window-version = "hyprland";
    monitor-primary = "HDMI-A-1";
    monitor-secondary = "";
  };
  components = [
    "lan-mouse"
  ];
  apps = [
    # "nushell"
    "yt-dlp"
    "wayvnc"
    "sunshine"
    "obs-studio"
    "aegisub"
    "subtitlecomposer"
    # "subtitleedit"
    "ffsubsync"
    "python313Packages.subliminal"
  ];
}
