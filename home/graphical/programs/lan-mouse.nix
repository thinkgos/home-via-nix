{
  config,
  lib,
  pkgs,
  extra-pkgs,
  ...
}:
{

  programs.lan-mouse = {
    enable = true;
    systemd = true;
    package = extra-pkgs.lan-mouse;
    # Optional configuration in nix syntax, see config.toml for available options
    # settings = {
    #   release_bind = [
    #     "KeyA"
    #     "KeyS"
    #     "KeyD"
    #     "KeyF"
    #   ];
    #   port = 4242;
    # };
  };
}
