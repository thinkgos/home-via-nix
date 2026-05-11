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
      url = "github:thinkgos/wayscrollshot";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
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
      home-manager,
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
                  ];
                  # Optionally use extraSpecialArgs
                  # to pass through arguments to home.nix
                  extraSpecialArgs = {
                    inherit customize;
                    extra-pkgs = {
                      lan-mouse = inputs.lan-mouse.packages.${system}.default;
                      goup-rs = inputs.goup-rs.packages.${system}.default;
                      wayscrollshot = inputs.wayscrollshot.packages.${system}.default;

                      #  hyprland
                      hyprland = inputs.hyprland.packages.${system}.hyprland;
                      xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
                      hyprsplit = inputs.hyprsplit.packages.${system}.default;
                      hypr-kcs = inputs.hypr-kcs.packages.${system}.default;
                      #  niri
                      niri = inputs.niri.packages.${system}.niri-unstable;
                    };
                  };
                };
            in
            {
              thinkgo-laptop = mkHome (
                import ./hosts/thinkgo-laptop.nix {
                  inherit lib;
                  inherit pkgs;
                }
              );
              cors-beelink = mkHome (
                import ./hosts/cors-beelink.nix {
                  inherit lib;
                  inherit pkgs;
                }
              );
              thinkgo-work = mkHome (
                import ./hosts/thinkgo-work.nix {
                  inherit lib;
                  inherit pkgs;
                }
              );
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
