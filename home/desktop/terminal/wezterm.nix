{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://nix-community.github.io/home-manager/options/home-manager/programs/wezterm.html
  programs.wezterm = {
    enable = true;
    # https://wezfurlong.org/wezterm/config/files.html
    settings = {
      color_scheme = "Catppuccin Mocha";
      font_size = 11;
      font = lib.generators.mkLuaInline ''
        wezterm.font_with_fallback({
        	"JetBrains Mono",
        	"FiraCode Nerd Font",
        	"Hack Nerd Font",
        	"Noto Sans CJK SC",
        })
      '';
      #
      window_decorations = "NONE";
      window_background_opacity = 0.85;
      default_cursor_style = "BlinkingBar";
      window_padding = {
        left = 8;
        right = 8;
        top = 0;
        bottom = 0;
      };
      hide_tab_bar_if_only_one_tab = true;
      # key binding
      leader = {
        key = "m";
        mods = "CTRL";
        timeout_millisends = 1000;
      };
      keys = [
        # 标签页管理
        {
          key = "1";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(0)";
        }
        {
          key = "2";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(1)";
        }
        {
          key = "3";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(2)";
        }
        {
          key = "4";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(3)";
        }
        {
          key = "5";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(4)";
        }
        {
          key = "6";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(5)";
        }
        {
          key = "7";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(6)";
        }
        {
          key = "8";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(7)";
        }
        {
          key = "9";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTab(8)";
        }
        {
          key = "PageUp";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTabRelative(-1)";
        }
        {
          key = "PageDown";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTabRelative(1)";
        }
        {
          key = "Tab";
          mods = "CTRL";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTabRelative(-1)";
        }
        {
          key = "Tab";
          mods = "CTRL|SHIFT";
          action = lib.generators.mkLuaInline "wezterm.action.ActivateTabRelative(1)";
        }
        # 窗口管理
        {
          key = "e";
          mods = "CTRL|SHIFT";
          action = lib.generators.mkLuaInline ''wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })'';
        }
        {
          key = "d";
          mods = "CTRL|SHIFT";
          action = lib.generators.mkLuaInline ''wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })'';
        }
      ];
    };
    extraConfig = "";
  };
}
