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
    # 配置路径, 默认~/.claude
    # configDir = "${config.home.homeDirectory}/.claude";
    # 自定义output styles
    outputStyles = { };
    settings = import ./settings.nix { inherit config lib pkgs; };
    plugins = import ./plugins.nix { inherit config lib pkgs; };
    lspServers = import ./lsp-servers.nix { inherit config lib pkgs; };
    mcpServers = import ./mcp-servers.nix { inherit config lib pkgs; };
    # 全局上下文
    # context = "";
    # 自定义marketplaces
    marketplaces = import ./marketplaces.nix { inherit config lib pkgs; };
    # 自定义agents, 默认${configDir}/agents
    # agentsDir = null;
    agents = import ./agents.nix { inherit config lib pkgs; };
    # 自定义commands,  默认${configDir}/commands
    # commandsDir = null;
    commands = import ./commands.nix { inherit config lib pkgs; };
    # 自定义hooks, 默认${configDir}/hooks
    # hooksDir = null;
    hooks = import ./hooks.nix { inherit config lib pkgs; };
    # 自定义rules, 默认${configDir}/rules
    # rulesDir = null;
    rules = import ./rules.nix { inherit config lib pkgs; };
    # 自定义skills
    skills = import ./skills.nix { inherit config lib pkgs; };
  };
}
