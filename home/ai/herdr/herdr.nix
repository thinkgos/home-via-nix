{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://herdr.dev/zh-cn/docs/
  # https://nix-community.github.io/home-manager/options/home-manager/programs/herdr.html
  programs.herdr = {
    enable = true;
    settings = {

    };
  };
}
