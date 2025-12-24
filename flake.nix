{
  description = "Home Manager configuration of thinkgo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
        { pkgs, ... }:
        {
          legacyPackages.homeConfigurations =
            let
              mkHome =
                { ... }@customize:
                inputs.home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                  modules = [ ./home ];
                  # Optionally use extraSpecialArgs
                  # to pass through arguments to home.nix
                  extraSpecialArgs = { inherit customize; };
                };
            in
            {
              thinkgo-fedora43 = mkHome {
                username = "thinkgo";
                graphics = true;
                window = "gnome";
                window-version = "gnome-49";
              };
              thinkgo-ubuntu24_04 = mkHome {
                username = "thinkgo";
                graphics = true;
                window = "gnome";
                window-version = "gnome-48";
              };
              thinkgo-hyprland = mkHome {
                username = "thinkgo";
                graphics = true;
                window = "hyprland";
                distro = null;
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

          apps = {
            cargo-bin = {
              type = "app";
              program =
                let
                  script = pkgs.writeShellScriptBin "cargo-bin" ''
                    echo "!! Install via cargo"
                  '';
                in
                "${script}/bin/cargo-bin";
            };
          };
        };
    };
}
