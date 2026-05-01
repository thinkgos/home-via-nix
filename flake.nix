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
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    lan-mouse.url = "github:feschber/lan-mouse";
    hypr-kcs.url = "github:kosa12/hyprKCS";
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
                  ];
                  # Optionally use extraSpecialArgs
                  # to pass through arguments to home.nix
                  extraSpecialArgs = {
                    customize = args // {
                      inherit desktop;
                    };
                    extra-pkgs = {
                      hyprland = inputs.hyprland.packages.${system}.hyprland;
                      xdg-desktop-portal-hyprland = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
                      hyprsplit = inputs.hyprsplit.packages.${system}.default;
                      lan-mouse = inputs.lan-mouse.packages.${system}.default;
                      hypr-kcs = inputs.hypr-kcs.packages.${system}.default;
                    };
                  };
                };
            in
            {
              # 可选apps列表: yt-dlp, wayvnc, sunshine
              thinkgo-laptop = mkHome {
                username = "thinkgo";
                disable-long-build = false;
                desktop = {
                  window = "hyprland";
                  window-version = "hyprland";
                  attrs = {
                    monitor-primary = "eDP-1";
                    monitor-secondary = "";
                  };
                };
                apps = [ ];
              };
              cors-ubuntu26_04 = mkHome {
                username = "cors";
                disable-long-build = false;
                desktop = {
                  window = "hyprland";
                  window-version = "hyprland";
                  attrs = {
                    monitor-primary = "HDMI-A-1";
                    monitor-secondary = "";
                  };
                };
                apps = [
                  "yt-dlp"
                  "wayvnc"
                  "sunshine"
                ];
              };
              thinkgo-ubuntu25_10 = mkHome {
                username = "thinkgo";
                disable-long-build = false;
                desktop = {
                  window = "gnome";
                  window-version = "gnome-49";
                };
              };
              apps = [ ];
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
