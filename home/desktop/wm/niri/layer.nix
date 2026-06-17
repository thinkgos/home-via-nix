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
    # {
    #   matches = [ { namespace = "^wofi$"; } ];
    #   background-effect = {
    #     blur = true;
    #   };
    # }
    # {
    #   matches = [ { namespace = "^rofi$"; } ];
    #   background-effect = {
    #     blur = true;
    #   };
    # }
    # {
    #   matches = [ { namespace = "^vicinae$"; } ];
    #   background-effect = {
    #     blur = true;
    #   };
    # }
  ];
}
