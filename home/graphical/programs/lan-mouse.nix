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
    # settings = { };
  };

  home.activation.create-lan-mouse-default-config = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    file=${config.xdg.configHome}/lan-mouse/config.toml
    if [ ! -f "$file" ]; then
      mkdir -p "$(dirname "$file")"
      touch "$file"
    fi
  '';
}
