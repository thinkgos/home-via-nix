{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  # https://nix-community.github.io/home-manager/options/home-manager/programs/wezterm.html
  programs.wezterm = {
    enable = true;
    # https://wezfurlong.org/wezterm/config/files.html
    settings = {
      color_scheme = "Catppuccin Mocha";
      font_size = 11;
      font = mkLuaInline ''
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
      disable_default_key_bindings = true;
      leader = {
        key = "m";
        mods = "CTRL";
        timeout_millisends = 1000;
      };
      keys = [
        # 杂项
        {
          # 减少字体大小
          key = "-";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.DecreaseFontSize";
        }
        {
          # 增加字体大小
          key = "=";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.IncreaseFontSize";
        }
        {
          # 重置字体大小
          key = "0";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ResetFontSize";
        }
        {
          # 复制
          key = "c";
          mods = "CTRL|SHIFT";
          action = mkLuaInline ''wezterm.action.CopyTo("Clipboard")'';
        }
        {
          # 粘贴
          key = "v";
          mods = "CTRL|SHIFT";
          action = mkLuaInline ''wezterm.action.PasteFrom("Clipboard")'';
        }
        {
          # 新建
          key = "n";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.SpawnWindow";
        }
        {
          # 命令面板
          key = "p";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.ActivateCommandPalette";
        }
        {
          # 搜索
          key = "f";
          mods = "CTRL|SHIFT";
          action = mkLuaInline ''wezterm.action.Search({ CaseSensitiveString = "" })'';
        }
        {
          # 重载配置
          key = "r";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.ReloadConfiguration";
        }
        {
          # 全屏
          key = "Enter";
          mods = "ALT";
          action = mkLuaInline "wezterm.action.ToggleFullScreen";
        }

        # 标签页管理
        {
          # 新建标签页
          key = "t";
          mods = "CTRL|SHIFT";
          action = mkLuaInline ''wezterm.action.SpawnTab("CurrentPaneDomain")'';
        }
        {
          # 关闭标签页
          key = "w";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.CloseCurrentTab({ confirm = true })";
        }
        {
          # 聚焦左边标签页
          key = "PageUp";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTabRelative(-1)";
        }
        {
          # 聚焦右边标签页
          key = "PageDown";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTabRelative(1)";
        }
        {
          # 聚焦左边标签页
          key = "Tab";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTabRelative(-1)";
        }
        {
          # 聚焦右边标签页
          key = "Tab";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.ActivateTabRelative(1)";
        }
        {
          # 移动标签页到左边
          key = "PageUp";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.MoveTabRelative(-1)";
        }
        {
          # 移动标签页到右边
          key = "PageDown";
          mods = "CTRL|SHIFT";
          action = mkLuaInline "wezterm.action.MoveTabRelative(1)";
        }
        {
          # 聚焦标签页1
          key = "1";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(0)";
        }
        {
          # 聚焦标签页2
          key = "2";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(1)";
        }
        {
          # 聚焦标签页3
          key = "3";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(2)";
        }
        {
          key = "4";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(3)";
        }
        {
          # 聚焦标签页5
          key = "5";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(4)";
        }
        {
          # 聚焦标签页6
          key = "6";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(5)";
        }
        {
          # 聚焦标签页7
          key = "7";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(6)";
        }
        {
          # 聚焦标签页8
          key = "8";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(7)";
        }
        {
          # 聚焦标签页9
          key = "9";
          mods = "CTRL";
          action = mkLuaInline "wezterm.action.ActivateTab(8)";
        }

        # 窗格(pane)管理
        {
          # 垂直分割窗格
          key = "e";
          mods = "CTRL|SHIFT";
          action = mkLuaInline ''wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })'';
        }
        {
          # 水平分割窗格
          key = "d";
          mods = "CTRL|SHIFT";
          action = mkLuaInline ''wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })'';
        }
        {
          # 聚焦上方窗格
          key = "UpArrow";
          mods = "CTRL|ALT";
          action = mkLuaInline ''wezterm.action.ActivatePaneDirection("Up")'';
        }
        {
          # 聚焦下方窗格
          key = "DownArrow";
          mods = "CTRL|ALT";
          action = mkLuaInline ''wezterm.action.ActivatePaneDirection("Down")'';
        }
        {
          # 聚焦左侧窗格
          key = "LeftArrow";
          mods = "CTRL|ALT";
          action = mkLuaInline ''wezterm.action.ActivatePaneDirection("Left")'';
        }
        {
          # 聚焦右侧窗格
          key = "RightArrow";
          mods = "CTRL|ALT";
          action = mkLuaInline ''wezterm.action.ActivatePaneDirection("Right")'';
        }
        {
          # 切换窗格缩放状态
          key = "z";
          mods = "CTRL|ALT";
          action = mkLuaInline "wezterm.action.TogglePaneZoomState";
        }
      ];
    };
    extraConfig = "";
  };
}
