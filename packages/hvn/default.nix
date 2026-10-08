{
  config,
  lib,
  pkgs,
  ...
}:
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
        vicinae
        awww
        wpaperd
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
        vicinae
        phonto
      ];
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
  ];
}
