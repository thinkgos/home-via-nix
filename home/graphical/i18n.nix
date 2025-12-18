{ config, lib, pkgs, ... }: 
{
  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };

  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          qt6Packages.fcitx5-chinese-addons
        ];

        settings = {
          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
              Layout = "";
            };
            "Groups/0/Items/1" = {
              Name = "wbpy";
              Layout = "";
            };
          };

          globalOptions = {
            Hotkey = {
              EnumerateWithTriggerKeys = "True"; # 反复按切换键时进行轮换
              EnumerateSkipFirst = "False";      # 轮换输入法时跳过第一个输入法
              ModifierOnlyKeyTimeout = 250;
            };
            Behavior = {
              ActiveByDefault = "False";    # 默认状态为激活
              ShareInputState = "All";      # 共享输入状态
              DefaultPageSize = 10;         # 默认页大小
            };
          };
   
          addons = {
            punctuation.globalSection = {
              HalfWidthPuncAfterLetterOrNumber = "True";  # 字母或数字后是否启用半角标点
              TypePairedPunctuationsTogether = "False";   # 同时输入成对标点 (例如引号)
              Enabled = "False";                          # True: 全角标点, False: 半角标点
            };
            classicui.globalSection = {
              "Vertical Candidate List" = "False";              # 垂直候选列表
              WheelForPaging = "True";                          # 使用鼠标滚轮翻页
              Font = "JetBrainsMono Nerd Font Mono 12";         # 字体
              MenuFont = "JetBrainsMono Nerd Font Mono 12";     # 菜单字体
              TrayFont = "JetBrainsMono Nerd Font Mono 12";     # 托盘字体
              TrayOutlineColor = "#1f1f1f";                   # 托盘标签轮廓颜色
              TrayTextColor = "#ffffff";                      # 托盘标签文本颜色
              PreferTextIcon = "False";                         # 优先使用文字图标
              ShowLayoutNameInIcon = "True";                    # 在图标中显示布局名称
              UseInputMethodLanguageToDisplayText = "True";     # 使用输入法的语言来显示文字
              Theme = "default";                                # 主题
              DarkTheme = "default-dark";                       # 深色主题
              UseDarkTheme = "False";                           # 跟随系统浅色/深色设置
              UseAccentColor = "True";                          # 当被主题和桌面支持时使用系统的重点色
              PerScreenDPI = "False";                           # 在 X11 上针对不同屏幕使用单独的 DPI
              ForceWaylandDPI = 5;                              # 固定 Wayland 的字体 DPI
              EnableFractionalScale = "True";                   # 在 Wayland 下启用分数缩放
            };
          };
        };
      };
    };
  };
}