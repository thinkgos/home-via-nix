{
  lib,
  pkgs,
  ...
}:
# hyprsplit lua 脚本: https://github.com/shezdy/hyprsplit
pkgs.fetchFromGitHub {
  owner = "shezdy";
  repo = "hyprsplit";
  rev = "main";
  hash = "sha256-Mqp4df5J+7+zBepqT+XBprIri/J2d+3ZNh+GX5P0FGU=";
}
