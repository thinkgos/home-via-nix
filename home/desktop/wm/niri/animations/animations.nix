{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Niri 动画配置
  # 风格: 基于 HYDE-dynamic, 使用 spring 物理弹簧动画
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsanimations
  programs.niri.settings.animations = {
    enable = true;
    slowdown = 2.0;
    workspace-switch = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 1.0;
          stiffness = 1000;
          epsilon = 0.0001;
        };
      };
    };

    window-open = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-quad";
          duration-ms = 200;
        };
      };
    };
    window-close = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-cubic";
          duration-ms = 200;
        };
      };
    };

    horizontal-view-movement = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 1.0;
          stiffness = 900;
          epsilon = 0.0001;
        };
      };
    };

    window-movement = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.8;
          stiffness = 800;
          epsilon = 0.0001;
        };
      };
    };
    window-resize = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 1.0;
          stiffness = 1000;
          epsilon = 0.0001;
        };
      };
    };
    config-notification-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.6;
          stiffness = 1200;
          epsilon = 0.001;
        };
      };
    };
    screenshot-ui-open = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-quad";
          duration-ms = 300;
        };
      };
    };

    overview-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 1.0;
          stiffness = 900;
          epsilon = 0.0001;
        };
      };
    };
    exit-confirmation-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.6;
          stiffness = 500;
          epsilon = 0.01;
        };
      };
    };
  };
}
