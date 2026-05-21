{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 控制
  home.packages = [
    # 隐藏/显示waybar
    (pkgs.writeShellScriptBin "bt-toggle-waybar" (builtins.readFile ./toggle-waybar.sh))
    # 屏幕锁定
    (pkgs.writeShellApplication {
      name = "bt-action-screen-lock";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./screen-lock.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        hyprlock
        hyprland
      ];
    })
    # 截图
    (pkgs.writeShellApplication {
      name = "bt-action-screenshot";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./screen.sh}
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
    })
    # 关机
    (pkgs.writeShellApplication {
      name = "bt-action-shutdown";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./shutdown.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        zenity
        hyprshutdown
      ];
    })
    # 聚焦到最后一个工作区
    (pkgs.writeShellApplication {
      name = "bt-focus-last-workspace";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./switch-last-workspace.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        hyprland
        jq
      ];
    })
  ];
}
