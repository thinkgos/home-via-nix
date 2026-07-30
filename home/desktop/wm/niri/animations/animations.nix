{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Niri 动画配置
  # https://yalter.github.io/niri/Configuration:-Animations
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsanimations
  programs.niri.settings.animations = {
    enable = true;
    slowdown = 2.0;

    workspace-switch = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 750;
          epsilon = 0.0001;
        };
      };
    };

    window-open = {
      enable = true;
      kind = {
        easing = {
          curve = "linear";
          duration-ms = 250;
        };
      };
      custom-shader = builtins.readFile ./window-open.glsl;
    };
    window-close = {
      enable = true;
      kind = {
        easing = {
          curve = "linear";
          duration-ms = 250;
        };
      };
      custom-shader = builtins.readFile ./window-close.glsl;
    };

    horizontal-view-movement = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 500;
          epsilon = 0.0001;
        };
      };
    };
    window-movement = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 500;
          epsilon = 0.0001;
        };
      };
    };
    window-resize = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 500;
          epsilon = 0.0001;
        };
      };
    };
    config-notification-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.5;
          stiffness = 750;
          epsilon = 0.001;
        };
      };
    };
    screenshot-ui-open = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-quad";
          duration-ms = 200;
        };
      };
    };
    overview-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 750;
          epsilon = 0.0001;
        };
      };
    };
    exit-confirmation-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 750;
          epsilon = 0.0001;
        };
      };
    };
  };
}
