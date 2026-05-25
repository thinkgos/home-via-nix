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
  };

  # 屏幕锁定
  screen-lock = pkgs.writeShellApplication {
    name = "wme-screen-lock";
    text = ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./control/screen-lock.sh}
    '';
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      hyprlock
      hyprland
    ];
  };
  # 截图
  screenshot = pkgs.writeShellApplication {
    name = "wme-screenshot";
    text = ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./control/screen.sh}
    '';
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      slurp
      grim
      jq
      satty
      wayscrollshot
      wl-clipboard
      tesseract
      hyprland
    ];
  };
  # 关机
  power = pkgs.writeShellApplication {
    name = "wme-power";
    text = ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./control/power.sh}
    '';
    excludeShellChecks = [
      "SC1091"
      "SC2181"
    ];
    runtimeInputs = with pkgs; [
      zenity
      hyprshutdown
    ];
  };
  # 聚焦到最后一个工作区
  focus-last-workspace = pkgs.writeShellApplication {
    name = "wme-focus-last-workspace";
    text = ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile ./control/switch-last-workspace.sh}
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
