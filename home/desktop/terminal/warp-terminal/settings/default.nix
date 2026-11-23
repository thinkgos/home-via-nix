{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/
  account = import ./account.nix { inherit config lib pkgs; };
  agents = import ./agents.nix { inherit config lib pkgs; };
  appearance = import ./appearance.nix { inherit config lib pkgs; };
  code = import ./code.nix { inherit config lib pkgs; };
  general = import ./general.nix { inherit config lib pkgs; };
  notifications = import ./notifications.nix { inherit config lib pkgs; };
  privacy = import ./privacy.nix { inherit config lib pkgs; };
  system = import ./system.nix { inherit config lib pkgs; };
  terminal = import ./terminal.nix { inherit config lib pkgs; };
  text_editing = import ./text_editing.nix { inherit config lib pkgs; };
  warp_drive = import ./warp_drive.nix { inherit config lib pkgs; };
  warpify = import ./warpify.nix { inherit config lib pkgs; };
}
