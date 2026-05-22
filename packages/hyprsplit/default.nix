{
  lib,
  pkgs,
  ...
}:
# hyprsplit lua 脚本: https://github.com/shezdy/hyprsplit
pkgs.fetchFromGitHub {
  owner = "thinkgos";
  repo = "hyprsplit";
  rev = "main";
  hash = "sha256-sRx1fQo3/HOlMOeWNCqaBEuDeIL7MA4cih1bj7l0svE=";
}
