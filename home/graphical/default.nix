{ config, lib, pkgs, customize, ... }: 
{
  imports = [
    ./shell
    ./editor
    ./devtools
  ]
  ++ lib.optional (customize.window == "hyprland") ./windows/hyprland.nix
  ++ lib.optional (customize.window == "gnome") ./windows/gnome.nix;

  xdg = {
    enable = true;
    mime.enable = true;
  };

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "redisinsight"
      "vscode"
      "spotify"
    ];
  };

  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };

  home.packages = with pkgs;[
    flameshot       # 截图工具
    localsend       # 局域网文件传输工具
    vlc             # 多媒体播放器
    mission-center  # 监控您的CPU,内存,磁盘,网络和GPU使用情况
  ];

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
          globalOptions = {
            Hotkey = {
              EnumerateWithTriggerKeys = true;
              EnumerateSkipFirst = false;
              ModifierOnlyKeyTimeout = 250;
            };
            Behavior = {
              ActiveByDefault = false;
              ShareInputState = "All";
            };
          };
   
          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
            };
            "Groups/0/Items/1" = {
              Name = "wbpy";
              DefaultIM = "wbpy";
            };
          };
        };
      };
    };
  };

  programs = {
    thunderbird = {
      enable = true;
      profiles = {};
    };
  };
}