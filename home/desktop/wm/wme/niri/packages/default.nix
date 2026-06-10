{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 截图
  wl-active-window = pkgs.writeShellApplication {
    name = "wl-active-window";
    text = builtins.readFile ./control/wl-active-window.sh;
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      jq
      niri-unstable
    ];
  };

  dropdown-terminal = pkgs.writeShellApplication {
    name = "wme-dropdown-terminal";
    text = builtins.readFile ./popup/dropdown-terminal.sh;
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      jq
      kitty
      niri-unstable
    ];
  };

  # # 聚焦到最后一个工作区
  # focus-last-workspace = pkgs.writeShellApplication {
  #   name = "wme-focus-last-workspace";
  #   text = ''
  #     source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
  #     ${builtins.readFile ./control/focus-last-workspace.sh}
  #   '';
  #   excludeShellChecks = [
  #     "SC1091"
  #     "SC2181"
  #   ];
  #   runtimeInputs = with pkgs; [
  #     hyprland
  #     jq
  #   ];
  # };

  # # 移动窗口到最后工作区
  # window-move-to-last-workspace = pkgs.writeShellApplication {
  #   name = "wme-window-move-to-last-workspace";
  #   text = ''
  #     source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
  #     ${builtins.readFile ./control/window-move-to-last-workspace.sh}
  #   '';
  #   excludeShellChecks = [
  #     "SC1091"
  #     "SC2181"
  #   ];
  #   runtimeInputs = with pkgs; [
  #     hyprland
  #     jq
  #   ];
  # };
}
