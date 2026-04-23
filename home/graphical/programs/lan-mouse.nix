{
  config,
  lib,
  pkgs,
  extra-pkgs,
  ...
}:
{

  imports = [ extra-pkgs.lan-mouse.homeManagerModules.default ];

  programs.lan-mouse = {
    enable = true;
    systemd = true;
    # package = extra-pkgs.lan-mouse.packages.${pkgs.stdenv.hostPlatform.system}.default
    # Optional configuration in nix syntax, see config.toml for available options
    # settings = { };
  };
}
