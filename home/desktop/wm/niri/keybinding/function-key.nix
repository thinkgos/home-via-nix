{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Niri 功能键绑定
  # https://github.com/sodiboo/niri-flake/blob/main/docs.md#programsnirisettingsbinds
  programs.niri.settings.binds = {
    # 锁定状态绑定
    "XF86AudioMute" = {
      # action.spawn = [
      #   "${pkgs.wireplumber}/bin/wpctl"
      #   "set-mute"
      #   "@DEFAULT_AUDIO_SINK@"
      #   "toggle"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--output-volume"
        "mute-toggle"
      ];
      repeat = false;
      allow-when-locked = true;
      # hotkey-overlay.title = "声音关闭/打开";
    };
    "XF86AudioMicMute" = {
      # action.spawn = [
      #   "${pkgs.wireplumber}/bin/wpctl"
      #   "set-mute"
      #   "@DEFAULT_AUDIO_SOURCE@"
      #   "toggle"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--input-volume"
        "mute-toggle"
      ];
      repeat = false;
      allow-when-locked = true;
      # hotkey-overlay.title = "麦克风关闭/打开";
    };
    # 声音调整
    "XF86AudioRaiseVolume" = {
      # action.spawn = [
      #   "${pkgs.wireplumber}/bin/wpctl"
      #   "set-volume"
      #   "@DEFAULT_AUDIO_SINK@"
      #   "5%+"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--output-volume"
        "5"
      ];
      repeat = true;
      allow-when-locked = true;
      # hotkey-overlay.title = "音量增加";
    };
    "XF86AudioLowerVolume" = {
      # action.spawn = [
      #   "${pkgs.wireplumber}/bin/wpctl"
      #   "set-volume"
      #   "@DEFAULT_AUDIO_SINK@"
      #   "5%-"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--output-volume"
        "-5"
      ];
      repeat = true;
      allow-when-locked = true;
      # hotkey-overlay.title = "音量减少";
    };
    # 亮度调整
    "XF86MonBrightnessUp" = {
      # action.spawn = [
      #   "${pkgs.brightnessctl}/bin/brightnessctl"
      #   "-d"
      #   "*backlight*"
      #   "set"
      #   "5%+"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--brightness"
        "+5"
        "--device"
        "*backlight*"
      ];
      repeat = true;
      allow-when-locked = true;
      # hotkey-overlay.title = "亮度增加";
    };
    "XF86MonBrightnessDown" = {
      # action.spawn = [
      #   "${pkgs.brightnessctl}/bin/brightnessctl"
      #   "-d"
      #   "*backlight*"
      #   "set"
      #   "5%-"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--brightness"
        "-5"
        "--device"
        "*backlight*"
      ];
      repeat = true;
      allow-when-locked = true;
      # hotkey-overlay.title = "亮度减少";
    };
    "XF86AudioPrev" = {
      # action.spawn = [
      #   "${pkgs.playerctl}/bin/playerctl"
      #   "previous"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--playerctl"
        "prev"
      ];
      repeat = false;
      allow-when-locked = true;
      # hotkey-overlay.title = "上一曲";
    };
    "XF86AudioNext" = {
      # action.spawn = [
      #   "${pkgs.playerctl}/bin/playerctl"
      #   "next"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--playerctl"
        "next"
      ];
      repeat = false;
      allow-when-locked = true;
      # hotkey-overlay.title = "下一曲";
    };
    "XF86AudioPlay" = {
      # action.spawn = [
      #   "${pkgs.playerctl}/bin/playerctl"
      #   "play"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--playerctl"
        "play"
      ];
      repeat = false;
      allow-when-locked = true;
      # hotkey-overlay.title = "播放";
    };
    "XF86AudioPause" = {
      # action.spawn = [
      #   "${pkgs.playerctl}/bin/playerctl"
      #   "pause"
      # ];
      action.spawn = [
        "${pkgs.swayosd}/bin/swayosd-client"
        "--playerctl"
        "pause"
      ];
      repeat = false;
      allow-when-locked = true;
      # hotkey-overlay.title = "暂停";
    };
  };
}
