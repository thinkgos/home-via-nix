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
  hash = "sha256-G/UIr1bKnxn1AcHl/4FL/jou6b7M2VeREslYVELxdmw=";
}
