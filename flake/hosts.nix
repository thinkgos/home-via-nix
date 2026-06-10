{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  mkHome =
    customize:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ../home
        (import ./overlays.nix {
          inherit
            config
            lib
            pkgs
            inputs
            ;
        })

        # Add the Home Manager module
        inputs.stylix.homeModules.stylix
        inputs.lan-mouse.homeManagerModules.default
        inputs.niri.homeModules.niri
      ];
      extraSpecialArgs = {
        inherit customize;
      };
    };
in
{
  thinkgo-laptop = mkHome (pkgs.callPackage ../hosts/thinkgo-laptop.nix { });
  cors-beelink = mkHome (pkgs.callPackage ../hosts/cors-beelink.nix { });
  thinkgo-work = mkHome (pkgs.callPackage ../hosts/thinkgo-work.nix { });
  thinkgo-laptop-niri = mkHome (pkgs.callPackage ../hosts/thinkgo-laptop-niri.nix { });
  cors-beelink-niri = mkHome (pkgs.callPackage ../hosts/cors-beelink-niri.nix { });
}
