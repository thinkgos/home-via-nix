{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://nix-community.github.io/home-manager/options/home-manager/programs/claude-code.html
  programs.claude-code = {
    enable = true;
    enableMcpIntegration = true;
    # configDir = "${config.home.homeDirectory}/.claude";
    marketplaces = import ./marketplaces.nix { inherit config lib pkgs; };
    plugins = import ./plugins.nix { inherit config lib pkgs; };
    # 全局上下文
    # context = "";
    agentsDir = null;
    agents = import ./agents.nix { inherit config lib pkgs; };
    commandsDir = null;
    commands = import ./commands.nix { inherit config lib pkgs; };
    hooksDir = null;
    hooks = import ./hooks.nix { inherit config lib pkgs; };
    rulesDir = null;
    rules = import ./rules.nix { inherit config lib pkgs; };
    skills = import ./skills.nix { inherit config lib pkgs; };
    lspServers = import ./lsp-servers.nix { inherit config lib pkgs; };
    mcpServers = import ./mcp-servers.nix { inherit config lib pkgs; };
    outputStyles = { };
    settings = import ./settings.nix { inherit config lib pkgs; };
  };
}
