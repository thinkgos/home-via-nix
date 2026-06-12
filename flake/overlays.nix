{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  nixpkgs.overlays = [
    (import ../overlays/packages { inherit config lib; })
    (import ../overlays/npins { inherit config lib; })
    (final: prev: {
      phonto = inputs.phonto.packages.${system}.default;
      anyrun = inputs.anyrun.packages.${system}.anyrun-with-all-plugins;
      anyrun-plugins = inputs.anyrun-plugins.packages.${system}.anyrun-plugins;
      ie-r = inputs.ie-r.packages.${system}.default;
      lan-mouse = inputs.lan-mouse.packages.${system}.default;
      kache = inputs.kache.packages.${system}.default;
      goup-rs = inputs.goup-rs.packages.${system}.default;
      wayscrollshot = inputs.wayscrollshot.packages.${system}.default;
    })

    # hyprland
    (final: prev: {
      hyprland = inputs.hyprland.packages.${system}.hyprland;
      xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
      hypr-kcs = inputs.hypr-kcs.packages.${system}.default;
      hyprlock = pkgs.hyprlock.overrideAttrs (oldAttrs: {
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.patchelf ];
        postFixup = ''
          file="$out/bin/hyprlock"
          patchelf --replace-needed libpam.so.0 /usr/lib/x86_64-linux-gnu/libpam.so.0 "$file"
          patchelf --add-needed /usr/lib/x86_64-linux-gnu/libaudit.so.1 "$file"
          patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcap-ng.so.0 "$file"
          patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcrypt.so.1 "$file"
          patchelf --add-needed /usr/lib/x86_64-linux-gnu/libpam_misc.so.0 "$file"
          patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcap.so.2 "$file"
        '';
      });
    })
    # niri
    inputs.niri.overlays.niri
    (final: prev: {
      niri = final.niri-unstable;
      # niri = final.niri-stable;
      piri = inputs.piri.packages.${system}.default;
    })
  ];
}
