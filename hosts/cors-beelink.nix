{ lib, pkgs }:
lib.recursiveUpdate
  (import ./preset.nix { inherit lib pkgs; })
  {
    username = "cors";
    desktop = {
      window = "hyprland";
      window-version = "hyprland";
      monitor-primary = "HDMI-A-1";
      monitor-secondary = "";
    };
    components = [
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
