{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      keybind = [
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
      copy-on-select = "clipboard";
      right-click-action = "paste";
      notify-on-command-finish = "always";

      # theme
      theme = "Catppuccin Mocha";

      # font
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 10;

      # window
      window-decoration = "none";
      window-position-x = 8;
      window-position-y = 8;
      window-save-state = "always";

      # tab bar
      gtk-wide-tabs = false;
      macos-titlebar-style = "transparent";

      # background
      background-opacity = 0.90;
      background-blur-radius = 30;
    };
    # themes = {};
  };
}
