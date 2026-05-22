{
  lib,
  pkgs,
  ...
}:
# https://noogle.dev/f/builtins/fetchGit/
# 没用使用npins的原因: https://github.com/andir/npins/pull/231
builtins.fetchGit {
  url = "https://github.com/thinkgos/home-via-nix-assets.git";
  ref = "main";
  rev = "3c96529cf08aaebeab947acf7d83416be9ddb240";
  lfs = true;
}
