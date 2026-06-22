{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://nix-community.github.io/home-manager/options/home-manager/programs/codex.html
  programs.codex = {
    enable = true;
    enableMcpIntegration = false;
    marketplaces = import ./marketplaces.nix { inherit config lib pkgs; };
    plugins = import ./plugins.nix { inherit config lib pkgs; };
    # 全局上下文
    # context = "";
    profiles = import ./profiles.nix { inherit config lib pkgs; };
    rules = import ./rules.nix { inherit config lib pkgs; };
    skills = import ./skills.nix { inherit config lib pkgs; };
    #  https://github.com/openai/codex/blob/main/codex-rs/config.md
    settings = import ./settings.nix { inherit config lib pkgs; };
  };
}
