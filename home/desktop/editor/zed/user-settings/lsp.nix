{
  config,
  lib,
  pkgs,
  ...
}:
{
  # rust
  rust-analyzer = {
    initialization_options = {
      cargo = {
        buildScripts = {
          enable = true;
        };
      };
      procMacro = {
        enable = true;
      };
      inlayHints = {
        maxLength = null;
        closureReturnTypeHints = {
          enable = "always";
        };
        lifetimeElisionHints = {
          enable = "skip_trivial";
          useParameterNames = true;
        };
      };
      imports = {
        granularity = {
          group = "module";
        };
        prefix = "self";
      };
      check = {
        command = "clippy";
      };
      completion = {
        callable = {
          snippets = "fill_arguments";
        };
        postfix = {
          enable = true;
        };
      };
    };
  };

  # nixd
  nixd = {
    binary = {
      path = "${pkgs.nil}/bin/nil";
      arguments = [ ];
    };
    settings = {
      nixd = {
        formatting = {
          command = [ "${pkgs.nixfmt}/bin/nixfmt" ];
        };
        nixpkgs = {
          expr = "import (builtins.getFlake \"nixpkgs\") { }";
        };
        options = {
          home-manager = {
            expr = "(builtins.getFlake (builtins.toString ./.)).homeConfigurations.<name>.options";
          };
        };
      };
      nil = {
        formatting = {
          command = [ "${pkgs.nixfmt}/bin/nixfmt" ];
        };
        nix = {
          binary = "${pkgs.nix}/bin/nix";
          maxMemoryMB = 2560;
          flake = {
            autoArchive = null;
            autoEvalInputs = false;
            nixpkgsInputName = "nixpkgs";
          };
        };
      };
    };
  };
}
