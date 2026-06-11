{ lib, pkgs }:
lib.recursiveUpdate (import ./preset.nix { inherit lib pkgs; }) {
  username = "thinkgo";
  desktop = {
    window = "hyprland";
    window-version = "hyprland";
    # monitor-primary = "HDMI-A-1";
    # monitor-secondary = "DP-1";
    monitor-primary = "DP-1";
    monitor-secondary = "";
  };
  components = [
    # 键鼠共享
    # "deskflow"
    # "lan-mouse"
    "lan-mouse-client"
  ];
  apps = [
    # "nushell"
    # "yt-dlp"
    # "wayvnc"
    # "sunshine"
    "obs-studio"
    # 视频剪辑
    # "aegisub"
    # "subtitlecomposer"
    # "subtitleedit"
    # "ffsubsync"
    # "python313Packages.subliminal"
  ];
  lang = [
    "go"
    "rust"
    "python"
    "cpp"
  ];
}
