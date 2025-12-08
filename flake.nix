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

  outputs = inputs@{ self, nixpkgs, flake-parts, home-manager, ... }: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      perSystem = { pkgs, ... }: {
        legacyPackages.homeConfigurations = 
          let makeHome = {...}@customize:
            inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [./home.nix];
              # Optionally use extraSpecialArgs
              # to pass through arguments to home.nix
              extraSpecialArgs = { inherit customize; };
            };
          in {
            thinkgo = makeHome { username = "thinkgo"; onGui = true; };
            nova = makeHome { username = "nova"; onGui = true; };
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
              in "${script}/bin/cargo-bin";
          };
        };
      };
    };
}
