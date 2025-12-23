{ config, lib, pkgs, ... }: 
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    profiles = {
      default = {
        # enableExtensionUpdateCheck = false;
        # enableUpdateCheck = false;
        extensions = with pkgs; [
          # remote development
          vscode-extensions.ms-vscode-remote.remote-ssh
          vscode-extensions.ms-vscode.remote-explorer
          vscode-extensions.ms-vscode-remote.remote-ssh-edit
          vscode-extensions.ms-vscode-remote.remote-containers
          vscode-extensions.ms-vscode-remote.vscode-remote-extensionpack

          # theme
          vscode-extensions.catppuccin.catppuccin-vsc-icons

          # 辅助
          vscode-extensions.w88975.code-translate
          vscode-extensions.streetsidesoftware.code-spell-checker
          #vscode-extensions.ryu1kn.partial-diff

          # usual
          vscode-extensions.aaron-bond.better-comments
          vscode-extensions.formulahendry.code-runner
          vscode-extensions.alefragnani.project-manager
          vscode-extensions.fill-labs.dependi
          vscode-extensions.usernamehw.errorlens

          # configuration
          vscode-extensions.tamasfe.even-better-toml
          vscode-extensions.redhat.vscode-yaml
          vscode-extensions.redhat.vscode-xml

          # git
          vscode-extensions.mhutchie.git-graph
          vscode-extensions.codezombiech.gitignore

          # protobuf
          
          # shell
          vscode-extensions.foxundermoon.shell-format
          # go
          vscode-extensions.golang.go
          # rust
          vscode-extensions.rust-lang.rust-analyzer
          # lua
          vscode-extensions.sumneko.lua
          # nix
          vscode-extensions.jnoortheen.nix-ide
          # python
          #vscode-extensions.ms-python.python
        ];
      };
    };
  };
}