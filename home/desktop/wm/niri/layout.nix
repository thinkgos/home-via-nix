{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 布局规则
  programs.niri.settings.layout = {
    gaps = 3;
    center-focused-column = "never";
    always-center-single-column = false;
    empty-workspace-above-first = false;
    default-column-display = "normal";
    background-color = "transparent";
    # background-color = "#585858ee";

    default-column-width = {
      proportion = 0.5;
    };
    preset-column-widths = [
      { proportion = 1. / 3.; }
      { proportion = 1. / 2.; }
      { proportion = 2. / 3.; }
      { proportion = 1.; }
    ];
    preset-window-heights = [
      { proportion = 1. / 3.; }
      { proportion = 1. / 2.; }
      { proportion = 2. / 3.; }
      { proportion = 1.; }
    ];
    focus-ring = {
      enable = true;
      width = 3;

      active = {
        gradient = {
          from = "#00ff99ee"; # 33ccffee
          in' = "oklab";
          to = "#6c71ffee";
          angle = 180;
          relative-to = "window";
        };
      };
      inactive = {
        color = "#595959aa";
      };
      urgent = {
        color = "#ed3eb2ee";
      };
    };
    border = {
      enable = false;
      width = 3;
      active = {
        color = "#6c71ffee";
        # gradient = {
        #   from = "#00ff99ee"; # 33ccffee
        #   in' = "oklab";
        #   to = "#6c71ffee";
        #   angle = 180;
        #   relative-to = "window";
        # };
      };
      inactive = {
        color = "#595959aa";
      };
      urgent = {
        color = "#ed3eb2ee";
      };
    };
    shadow = {
      enable = false;
    };
    tab-indicator = {
      enable = false;
    };
    insert-hint = {
      enable = false;
    };
    struts = {
      left = 2;
      right = 2;
      top = 2;
      bottom = 2;
    };
  };
}
