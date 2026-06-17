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
  name = "hvn";
  paths = [
    # popup

    (pkgs.writeShellApplication {
      name = "hvn-picker-wallpaper";
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

    (pkgs.writeShellApplication {
      name = "hvn-picker-phonto";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./picker/picker-phonto.sh}
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
      name = "hvn-runner-flatpak";
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
    # 截图
    (pkgs.writeShellApplication {
      name = "hvn-screen";
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
        satty
        wayscrollshot
        wl-clipboard
        tesseract
      ];
    })
    # 隐藏/显示waybar
    (pkgs.writeShellScriptBin "hvn-toggle-waybar" (builtins.readFile ./control/toggle-waybar.sh))
  ];
}
