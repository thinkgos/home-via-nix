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
    # 纯资源库
    home-assets = {
      url = "https://github.com/thinkgos/home-via-nix-assets/archive/main.tar.gz";
      flake = false;
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
        { pkgs, ... }:
        {
          legacyPackages.homeConfigurations =
            let
              mkHome =
                {
                  graphics ? true,
                  attributes ? null,
                  ...
                }@args:
                inputs.home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                  modules = [ ./home ];
                  # Optionally use extraSpecialArgs
                  # to pass through arguments to home.nix
                  extraSpecialArgs = {
                    inherit (inputs) home-assets;
                    customize = args // {
                      inherit graphics attributes;
                    };
                  };
                };
            in
            {
              thinkgo-fedora43 = mkHome {
                username = "thinkgo";
                window = "gnome";
                window-version = "gnome-49";
              };
              thinkgo-ubuntu25_10 = mkHome {
                username = "thinkgo";
                window = "gnome";
                window-version = "gnome-49";
              };
              cors-ubuntu25_10 = mkHome {
                username = "cors";
                window = "hyprland";
                window-version = "hyprland";
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
