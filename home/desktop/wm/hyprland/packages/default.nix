{
  config,
  lib,
  pkgs,
  ...
}:
{
  dropdown-terminal = pkgs.writeShellApplication {
    name = "wme-dropdown-terminal";
    text = builtins.readFile ./popup/dropdown-terminal.sh;
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      jq
      # kitty
      wezterm
      hyprland
    ];
  };

  # 聚焦到最后一个工作空间
  focus-last-workspace = pkgs.writeShellApplication {
    name = "wme-focus-last-workspace";
    text = ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./control/focus-last-workspace.sh}
    '';
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      hyprland
      jq
    ];
  };

  # 移动窗口到最后工作空间
  move-window-to-last-workspace = pkgs.writeShellApplication {
    name = "wme-move-window-to-last-workspace";
    text = ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./control/move-window-to-last-workspace.sh}
    '';
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      hyprland
      jq
    ];
  };
}
