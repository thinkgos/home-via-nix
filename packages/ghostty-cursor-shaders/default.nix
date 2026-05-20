{
  lib,
  pkgs,
  ...
}:
# 光标动画: https://github.com/sahaj-b/ghostty-cursor-shaders
pkgs.fetchFromGitHub {
  owner = "sahaj-b";
  repo = "ghostty-cursor-shaders";
  rev = "main";
  hash = "sha256-ruhEqXnWRCYdX5mRczpY3rj1DTdxyY3BoN9pdlDOKrE=";
}
