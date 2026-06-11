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
    fast-nix-gc.url = "github:Mic92/fast-nix-gc";
    phonto = {
      url = "github:museslabs/phonto";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun-plugins = {
      url = "github:thinkgos/anyrun-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ie-r = {
      url = "github:miaupaw/ie-r";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lan-mouse.url = "github:feschber/lan-mouse";
    kache = {
      url = "github:kunobi-ninja/kache";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    hypr-kcs.url = "github:kosa12/hyprKCS";

    # niri
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    piri = {
      url = "github:Asthestarsfalll/piri";
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
          config,
          lib,
          pkgs,
          ...
        }:
        {
          legacyPackages.homeConfigurations = pkgs.callPackage ./flake/hosts.nix { inherit inputs; };

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
