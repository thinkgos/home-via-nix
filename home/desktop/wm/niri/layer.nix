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
    # {
    #   matches = [ { namespace = "^vicinae$"; } ];
    #   background-effect = {
    #     blur = true;
    #   };
    # }
  ];
}
