{
  config,
  lib,
  pkgs,
  ...
}:
pkgs.symlinkJoin {
  name = "ohshell";
  paths = [
    (pkgs.writeShellApplication {
      name = "fzf-preview";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./scripts/shortcut/fzf-preview.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        fzf
        fd
        ripgrep
        bat
        jq
        vim
        wl-clipboard
      ];
    })
    (pkgs.writeShellApplication {
      name = "git-submodule";
      text = ''
        source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
        ${builtins.readFile ./scripts/shortcut/git-submodule.sh}
      '';
      excludeShellChecks = [
        "SC1091"
        "SC2181"
      ];
      runtimeInputs = with pkgs; [
        git
        parallel
      ];
    })
  ];
}
