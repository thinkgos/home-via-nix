{ lib, pkgs }:
lib.recursiveUpdate (import ./preset.nix { inherit lib pkgs; }) {
  username = "thinkgo";
  desktop = {
    window = "niri";
    window-version = "niri";
    monitor-primary = "eDP-1";
    monitor-secondary = "HDMI-A-1";
  };
  components = [
    # 键鼠共享
    # "deskflow"
    # "lan-mouse"
    # "lan-mouse-client"
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
    # "cpp"
  ];
}
