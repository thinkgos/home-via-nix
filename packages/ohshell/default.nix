{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkShell =
    name: src:
    pkgs.writeShellScriptBin name ''
      source ${pkgs.ohlib.log4sh}/lib/shell/log4sh.sh
      ${builtins.readFile src}
    '';
in
{
  fzf-preview = pkgs.writeShellApplication {
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
  };

  git-submodule = pkgs.writeShellApplication {
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
  };
}
