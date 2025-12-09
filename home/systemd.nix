{ config, lib, pkgs, ... }:
let
  nixPkg = if config.nix.package == null then pkgs.nix else config.nix.package;
in
{
  # relate issue:
  # - https://github.com/nix-community/home-manager/issues/1439
  # - https://gist.github.com/BohdanTkachenko/6ba2730ff54ecbb2d7aed22dec3507d5
  systemd.user.sessionVariables = {
    PATH = "$HOME/.nix-profile/bin:$HOME/.nix-profile/sbin:$PATH";
  };
  # Not work
  # TODO: remove when/if https://github.com/nix-community/home-manager/pull/7949 is merged.
  # xdg.configFile."systemd/user-environment-generators/05-home-manager.sh" = {
  #   text = ''
  #     . "${nixPkg}/etc/profile.d/nix.sh"
  #     . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
  #   '';
  #   executable = true;
  #   force = true;
  # };
}
