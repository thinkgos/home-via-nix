{
  config,
  lib,
  pkgs,
  ...
}:
{
  # swaync 全功能通知中心
  # https://github.com/ErikReider/SwayNotificationCenter
  services.swaync = {
    enable = true;
    # configSchema: https://github.com/ErikReider/SwayNotificationCenter/blob/main/src/configSchema.json
    settings = {
      positionX = "center";
      positionY = "top";
      layer = "top";
      layer-shell = true;
      layer-shell-cover-screen = true;
      cssPriority = "user";
      control-center-positionX = "none";
      control-center-positionY = "none";
      control-center-margin-top = 10;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      control-center-height = 600;
      control-center-width = 500;
      control-center-layer = "none";
      control-center-exclusive-zone = true;
      # control-center-preferred-output = "";
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 32;
      notification-body-image-width = 300;
      notification-body-image-height = 160;
      notification-window-width = 380;
      notification-window-height = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      # notification-window-preferred-output = "";
      fit-to-screen = false;
      relative-timestamps = true;
      keyboard-shortcuts = true;
      notification-grouping = true;
      transition-time = 200;
      image-visibility = "when-available";
      hide-on-clear = true;
      hide-on-action = true;
      text-empty = "No Notifications";
      script-fail-notify = true;
      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "🔕 请勿打扰";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 48;
          image-radius = 12;
          show-album-art = "always";
          autohide = true;
          loop-carousel = false;
          blacklist = [ ];
        };
        notifications = {
          vexpand = true;
        };
      };
      # scripts = {
      #   "xxx" = {
      #     exec = "";
      #     app-name = "";
      #     desktop-entry = "";
      #     summary = "";
      #     body = "";
      #     urgency = "Normal"; # Low, Normal, Critical
      #     sound-file = "";
      #     sound-name = "";
      #     run-on = "receive"; # action, receive
      #   };
      # };
    };
    style = builtins.readFile ./style.gtk.css;
  };
}
