{ config, lib, pkgs, ... }: 
{
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
      profiles = {

      };
    };
  };
}