{
  config,
  lib,
  pkgs,
  ...
}:
let
  # 光标动画: https://github.com/sahaj-b/ghostty-cursor-shaders
  cursorTrailShader = pkgs.fetchFromGitHub {
    owner = "sahaj-b";
    repo = "ghostty-cursor-shaders";
    rev = "main";
    hash = "sha256-ruhEqXnWRCYdX5mRczpY3rj1DTdxyY3BoN9pdlDOKrE=";
  };
in
{
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    # https://ghostty.org/docs/config/reference
    settings = {
      keybind = [
        # 全局热键：下拉终端,

        # GNOME 不支持wlr-layer-shell
        # warning(winproto_wayland): your compositor does not support the wlr-layer-shell protocol; disabling quick terminal
        # "global:super+enter=toggle_quick_terminal"

        # font size
        "ctrl+shift+minus=decrease_font_size:2" # 减少字体大小
        "ctrl+-=decrease_font_size:2" # 减少字体大小
        "ctrl+shift+plus=increase_font_size:2" # 增加字体大小
        "ctrl+==increase_font_size:2" # 增加字体大小
        "ctrl+0=reset_font_size" # 重置字体大小

        # 标签页管理
        "ctrl+shift+t=new_tab" # 创建标签页
        "ctrl+shift+q=close_tab" # 关闭标签页
        "ctrl+page_up=previous_tab" # 切换到上一个标签页
        "ctrl+shift+,=previous_tab" # 切换到上一个标签页
        "ctrl+page_down=next_tab" # 切换到下一个标签页
        "ctrl+shift+.=next_tab" # 切换到下一个标签页
        "ctrl+1=goto_tab:1" # 切换到第一个标签页
        "ctrl+2=goto_tab:2" # 切换到第二个标签页
        "ctrl+3=goto_tab:3" # 切换到第三个标签页
        "ctrl+4=goto_tab:4" # 切换到第四个标签页
        "ctrl+5=goto_tab:5" # 切换到第五个标签页
        "ctrl+6=goto_tab:6" # 切换到第六个标签页
        "ctrl+7=goto_tab:7" # 切换到第七个标签页
        "ctrl+8=goto_tab:8" # 切换到第八个标签页
        "ctrl+9=goto_tab:9" # 切换到第九个标签页

        # 窗口管理
        # 关闭窗口使用ctrl+d
        "ctrl+shift+e=new_split:down" # 水平分割窗口
        "ctrl+shift+d=new_split:right" # 垂直分割窗口
        "ctrl+shift+[=goto_split:previous" # 上一个窗口
        "ctrl+shift+left=goto_split:previous" # 上一个窗口
        "ctrl+shift+]=goto_split:next" # 下一个窗口
        "ctrl+shift+right=goto_split:next" # 下一个窗口
        # "ctrl+shift+r=resize_split:up:10" # 调整窗口大小
      ];

      # general
      scrollback-limit = 100000000;
      copy-on-select = "clipboard";
      right-click-action = "paste";
      clipboard-read = "allow";
      clipboard-write = "allow";
      clipboard-paste-protection = true;
      clipboard-paste-bracketed-safe = true;
      notify-on-command-finish = "always";

      # theme
      theme = "Catppuccin Mocha";
      # theme = "Dracula+";

      # font
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 10;
      font-thicken = true;
      adjust-cell-height = 2;

      # window
      window-theme = "auto";
      window-decoration = "none";
      window-position-x = 8;
      window-position-y = 8;
      window-save-state = "always";
      maximize = true;
      macos-titlebar-style = "transparent";

      # tab bar
      gtk-wide-tabs = false;

      # background
      background-opacity = 0.90;

      # cursor
      cursor-style = "bar";
      cursor-style-blink = true;
      cursor-opacity = 0.8;

      # custom shader
      custom-shader = "${cursorTrailShader}/cursor_tail.glsl";

      # 下拉终端(Quake 风格)
      # quick-terminal-position = "top";
      # quick-terminal-screen = "mouse";
      # quick-terminal-autohide = true;
      # quick-terminal-animation-duration = 0.15;
    };
    # themes = {};
  };
}
