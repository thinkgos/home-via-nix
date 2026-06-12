{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nirimod
  ];
  xdg.configFile."nirimod/settings.json".text = ''
    {
      "auto_update": false,
      "config_path": "",
      "backup_path": "",
      "auto_backup": false,
      "backup_limit": 10,
      "kofi_v3_dont_show": true
    }
  '';
}
