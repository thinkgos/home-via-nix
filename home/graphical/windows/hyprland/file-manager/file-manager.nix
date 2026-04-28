{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 文件管理器
  home.packages = with pkgs; [
    # nautilus
    nemo-with-extensions
  ];

  xdg.dataFile = {
    "nautilus/actions/open-in-kitty".text = ''
      [Nemo Action]
      Name=Open in Kitty
      Comment=Open Kitty terminal in the selected directory
      Exec=kitty --directory %P
      Icon-Name=kitty
      Selection=any
      Extensions=dir;none;
    '';
    "nautilus/actions/open-in-ghostty".text = ''
      [Nemo Action]
      Name=Open in Ghostty
      Comment=Open Ghostty terminal in the selected directory
      Exec=ghostty --working-directory=%P
      Icon-Name=com.mitchellh.ghostty
      Selection=any
      Extensions=dir;none;
    '';
  };
}
