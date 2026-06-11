{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 活跃窗口
  wl-active-window = pkgs.writeShellApplication {
    name = "wl-active-window";
    text = builtins.readFile ./wl-active-window.sh;
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      jq
      niri-unstable
    ];
  };
}
