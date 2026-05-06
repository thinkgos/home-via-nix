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
    lan-mouse.url = "github:feschber/lan-mouse";

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
        { pkgs, system, ... }:
        {
          legacyPackages.homeConfigurations =
            let
              mkHome =
                {
                  desktop ? null,
                  ...
                }@args:
                inputs.home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                  modules = [
                    ./home/home.nix

                    # Add the Home Manager module
                    inputs.lan-mouse.homeManagerModules.default
                    inputs.niri.homeModules.niri
                  ];
                  # Optionally use extraSpecialArgs
                  # to pass through arguments to home.nix
                  extraSpecialArgs = {
                    customize = args // {
                      inherit desktop;
                    };
                    extra-pkgs = {
                      lan-mouse = inputs.lan-mouse.packages.${system}.default;
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
              # 可选apps列表: nushell, yt-dlp, wayvnc, sunshine
              thinkgo-laptop = mkHome {
                username = "thinkgo";
                desktop = {
                  window = "hyprland";
                  window-version = "hyprland";
                  attrs = {
                    monitor-primary = "eDP-1";
                    monitor-secondary = "";
                    enable-video-clip = false;
                  };
                };
                apps = [ ];
              };
              cors-ubuntu26_04 = mkHome {
                username = "cors";
                desktop = {
                  window = "hyprland";
                  window-version = "hyprland";
                  attrs = {
                    monitor-primary = "HDMI-A-1";
                    monitor-secondary = "";
                    enable-video-clip = true;
                  };
                };
                apps = [
                  "nushell"
                  "yt-dlp"
                  "wayvnc"
                  "sunshine"
                ];
              };
              thinkgo-work = mkHome {
                username = "thinkgo";
                desktop = {
                  window = "hyprland";
                  window-version = "hyprland";
                  attrs = {
                    monitor-primary = "DP-1";
                    monitor-secondary = "";
                    enable-video-clip = false;
                  };
                };
                apps = [ ];
              };
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
