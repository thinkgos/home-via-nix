{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://www.warp.dev/terminal
  # https://nix-community.github.io/home-manager/options/home-manager/programs/warp-terminal.html
  # TODO: ...
  programs.warp-terminal = {
    enable = true;
    enableMcpIntegration = false;
    package = pkgs.warp-terminal.override { waylandSupport = true; };
    # https://docs.warp.dev/agents/inference/custom-routers/
    # https://docs.warp.dev/agents/inference/model-choice/
    customModelRouters = { };
    # https://docs.warp.dev/terminal/windows/tab-configs/
    defaultTabConfigs = { };
    # https://docs.warp.dev/getting-started/keyboard-shortcuts/
    # https://github.com/warpdotdev/keysets
    keybindings = { };
    # https://docs.warp.dev/terminal/sessions/launch-configurations/
    launchConfigurations = { };
    # https://docs.warp.dev/agents/capabilities/mcp/
    mcpServers = { };
    # https://docs.warp.dev/agents/capabilities/skills/
    skills = { };
    # https://docs.warp.dev/terminal/windows/tab-configs/
    tabConfigs = { };
    # https://docs.warp.dev/terminal/appearance/custom-themes/
    # https://github.com/warpdotdev/themes
    themes = { };
    # validateSettings = config.programs.warp-terminal.package != null;
    # https://docs.warp.dev/terminal/settings/all-settings/
    settings = import ./settings { inherit config lib pkgs; };
    # https://docs.warp.dev/terminal/entry/yaml-workflows/
    workflows = import ./workflows.nix { inherit config lib pkgs; };
  };
}
