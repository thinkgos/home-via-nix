{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Niri 层规则
  programs.niri.settings.input = {
    keyboard = {
      xkb = {
        layout = "us";
        #   model = "pc105";
        #   variant = "colemak_dh_ortho";
        #   options = "compose:ralt,ctrl:nocaps";
      };
      repeat-delay = 600;
      repeat-rate = 25;
      track-layout = "global";
    };
    mouse = {
      accel-profile = "adaptive";
      accel-speed = 0.5;
    };
    touchpad = {
      accel-profile = "adaptive";
      accel-speed = 0.5;
    };
    mod-key = "Super";
    mod-key-nested = "Alt";
  };
}
