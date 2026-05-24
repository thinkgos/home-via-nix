{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkImport = path: import path { inherit config lib pkgs; };
in
pkgs.symlinkJoin {
  name = "hwn";
  paths = [
    # popup
    (pkgs.writeShellApplication {
      name = "bt-popup-clipboard";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./popup/clipboard.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        cliphist
        fuzzel
        wl-clipboard
      ];
    })

    (pkgs.writeShellApplication {
      name = "bt-popup-dropdown-terminal";
      text = builtins.readFile ./popup/dropdown-terminal.sh;
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
    })

    (pkgs.writeShellApplication {
      name = "bt-picker-wallpaper";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./picker/picker-wallpaper.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        rofi
        awww
      ];
    })

    # runner
    (pkgs.writeShellApplication {
      name = "bt-runner-flatpak";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./runner/flatpak.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      # runtimeInputs = with pkgs; [ ];
    })

    # control
    # 隐藏/显示waybar
    (pkgs.writeShellScriptBin "bt-toggle-waybar" (builtins.readFile ./control/toggle-waybar.sh))

  ];
}
