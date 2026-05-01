{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 快速查找命令, 同tldr
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.tealdeer.enable
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
    # https://tealdeer-rs.github.io/tealdeer/config.html
    settings = {
      updates = {
        auto_update = true;
        auto_update_interval_hours = 72;
      };
    };
  };
}
