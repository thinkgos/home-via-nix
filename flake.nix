{
  description = "Home Manager configuration of thinkgo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lan-mouse.url = "github:feschber/lan-mouse";
    goup-rs = {
      url = "github:thinkgos/goup-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wayscrollshot = {
      url = "github:jswysnemc/wayscrollshot";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprshell = {
      url = "github:H3rmt/hyprshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypr-kcs.url = "github:kosa12/hyprKCS";

    # niri
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        {
          lib,
          pkgs,
          system,
          ...
        }:
        {
          legacyPackages.homeConfigurations =
            let
              mkHome =
                customize:
                inputs.home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                  modules = [
                    ./home/home.nix

                    # Add the Home Manager module
                    inputs.stylix.homeModules.stylix
                    inputs.lan-mouse.homeManagerModules.default
                    inputs.niri.homeModules.niri
                    inputs.hyprshell.homeModules.default

                    # Overlay extra packages into pkgs
                    {
                      nixpkgs.overlays = [
                        (final: prev: {
                          ohlib = import ./packages/ohlib {
                            inherit lib;
                            pkgs = final;
                          };
                          ohshell = import ./packages/ohshell {
                            inherit lib;
                            pkgs = final;
                          };
                          home-assets = import ./packages/home-assets {
                            inherit lib;
                            pkgs = final;
                          };
                          ghostty-cursor-shaders = import ./packages/ghostty-cursor-shaders {
                            inherit lib;
                            pkgs = final;
                          };
                          hyprsplit = import ./packages/hyprsplit {
                            inherit lib;
                            pkgs = final;
                          };

                          lan-mouse = inputs.lan-mouse.packages.${system}.default;
                          goup-rs = inputs.goup-rs.packages.${system}.default;
                          wayscrollshot = inputs.wayscrollshot.packages.${system}.default;

                          # hyprland
                          hyprland = inputs.hyprland.packages.${system}.hyprland;
                          xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
                          hyprshell = inputs.hyprshell.packages.${system}.default;
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

                          # niri
                          niri = inputs.niri.packages.${system}.niri-unstable;
                        })
                      ];
                    }
                  ];
                  extraSpecialArgs = {
                    inherit customize;
                  };
                };
            in
            {
              thinkgo-laptop = mkHome (import ./hosts/thinkgo-laptop.nix { inherit lib pkgs; });
              cors-beelink = mkHome (import ./hosts/cors-beelink.nix { inherit lib pkgs; });
              thinkgo-work = mkHome (import ./hosts/thinkgo-work.nix { inherit lib pkgs; });
            };

          devShells.default = pkgs.mkShell {
            packages = [
            ];
            env = {
            };
            # SHELL = "${pkgs.zsh}/bin/zsh";
            shellHook = ''
              echo "development shell ready!"
            '';
          };
        };
    };
}
