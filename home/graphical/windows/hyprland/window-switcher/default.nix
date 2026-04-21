{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 窗口切换器
  # https://github.com/H3rmt/hyprshell
  services.hyprshell = {
    enable = true;
    systemd = {
      enable = true;
      args = "";
    };
    # https://github.com/H3rmt/hyprshell/blob/hyprshell-release/docs/CONFIGURE.md#config-options
    settings = {
      version = 3;
      windows = {
        scale = 8.5;
        items_per_row = 5;
        overview = {
          modifier = "super";
          key = "a";
          filter_by = [ ];
          hide_filtered = false;
          exclude_special_workspaces = "";
          launcher = {
            default_terminal = "alacritty";
            launch_modifier = "ctrl";
            width = 650;
            max_items = 5;
            show_when_empty = true;
            plugins = {
              applications = {
                run_cache_weeks = 4;
                show_execs = true;
                show_actions_submenu = true;
              };
              terminal = { };
              shell = null;
              websearch = {
                engines = [
                  {
                    url = "https://www.google.com/search?q={}";
                    name = "Google";
                    key = "g";
                  }
                  {
                    url = "https://en.wikipedia.org/wiki/Special:Search?search={}";
                    name = "Wikipedia";
                    key = "w";
                  }
                  {
                    url = "https://chatgpt.com/?q={}";
                    name = "ChatGpt";
                    key = "c";
                  }
                ];
              };
              calc = { };
              path = { };
              actions = {
                actions = [
                  "lock_screen"
                  "hibernate"
                  "logout"
                  "reboot"
                  "shutdown"
                  "suspend"
                  {
                    custom = {
                      names = [
                        "Kill"
                        "Stop"
                      ];
                      details = "Kill or stop a process by name";
                      command = ''pkill "{}" && notify-send hyprshell "stopped {}"'';
                      icon = "remove";
                    };
                  }
                  {
                    custom = {
                      names = [ "Reload Hyprshell" ];
                      details = "Reload Hyprshell";
                      command = "sleep 1; hyprshell socat '\"Restart\"'";
                      icon = "system-restart";
                    };
                  }
                ];
              };
            };
          };
        };
        switch = {
          modifier = "alt";
          key = "Tab";
          filter_by = [ "current_monitor" ];
          switch_workspaces = false;
          exclude_special_workspaces = "";
        };
        switch_2 = null;
      };
    };
    # https://github.com/H3rmt/hyprshell/blob/hyprshell-release/docs/CONFIGURE.md#css
    style = ''
      :root {
          --border-color: rgba(75, 75, 90, 0.8);
          --border-color-active: rgba(189, 147, 249, 0.9);

          --bg-color: rgba(40, 42, 54, 0.8);
          --bg-color-hover: rgba(53, 55, 70, 0.9);

          --border-radius: 12px;
          --border-size: 3px;
          --border-style: solid;

          --text-color: rgba(248, 248, 242, 1);

          --window-padding: 2px;
          --bg-window-color: rgba(42, 47, 66, 0.95);
      }
    '';
  };
}
