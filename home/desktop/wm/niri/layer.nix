{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 层规则
  programs.niri.settings.layer-rules = [
    {
      # overview 壁纸
      matches = [ { namespace = "^wpaperd.*"; } ];
      place-within-backdrop = true;
    }
    {
      matches = [ { namespace = "^waybar$"; } ];
      background-effect = {
        blur = true;
      };
    }
    {
      matches = [ { namespace = "^(rofi|wofi|fuzzel)$"; } ];
      background-effect = {
        blur = true;
      };
    }
    {
      matches = [ { namespace = "^anyrun$"; } ];
      background-effect = {
        blur = true;
      };
      geometry-corner-radius = {
        top-left = 15.0;
        top-right = 15.0;
        bottom-left = 15.0;
        bottom-right = 15.0;
      };
    }
  ];
}
