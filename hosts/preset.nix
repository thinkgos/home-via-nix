# Preset host configuration.
# Hosts can override any field; objects are deep-merged, arrays are replaced.

# theme/icon/cursor:
# ls $(nix build nixpkgs#orchis-theme --no-link --print-out-paths)/share/[themes/icons/cursors]
# apps:
#   nushell, yt-dlp, wayvnc, sunshine, obs-studio
# components:
#   视频剪辑: video-clip
#   键鼠共享: deskflow, lan-mouse-client, lan-mouse
#   截图标注: flameshot
{ lib, pkgs }:
{
  username = "";
  theme = {
    name = "WhiteSur-Dark";
    package = pkgs.whitesur-gtk-theme;
  };
  icon = {
    name = "WhiteSur-dark";
    package = pkgs.whitesur-icon-theme;
  };
  cursor = {
    name = "catppuccin-latte-mauve-cursors";
    package = pkgs.catppuccin-cursors.latteMauve;
  };
  desktop = null;
  components = [ ];
  apps = [ ];
}
