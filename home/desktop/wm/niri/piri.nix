{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://github.com/Asthestarsfalll/piri
  home.packages = [ pkgs.piri ];

  xdg.configFile."niri/piri.toml".text = ''
    [niri]
    # Optional: Path to niri socket
    # If not specified, will use $XDG_RUNTIME_DIR/niri or /tmp/niri
    # socket_path = "/tmp/niri"

    [piri.plugins]
    empty = true
    scratchpads = true
    window_rule = false
    singleton = false
    window_order = false
    swallow = false
    workspace_rule = false
    mark = false
    sticky = true

    # Plugins configuration

    # Empty plugin: executes commands when switching to empty workspaces
    [empty.terminal]
    command = "${pkgs.alacritty}/bin/alacritty"
    #[empty.primary]
    #command = "code"

    # Scratchpads configuration
    [piri.scratchpad]
    default_size = "40% 60%"
    default_margin = 50
    # Optional: move hidden scratchpads to a specific workspace
    move_to_workspace = "stash"

    [scratchpads.dropdown-terminal]
    direction = "fromTop"
    # command = "${pkgs.kitty}/bin/kitty --class dropdown-terminal -o tab_bar_edge=bottom --title \"quake\""
    command = "${pkgs.wezterm}/bin/wezterm -e --class dropdown-terminal"
    app_id = "dropdown-terminal"
    size = "100% 40%"
    margin = 0
  '';
}
