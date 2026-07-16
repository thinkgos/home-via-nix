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

  # go
  gopls = {
    initialization_options = {
      hints = {
        assignVariableTypes = true;
        compositeLiteralFields = true;
        compositeLiteralTypes = true;
        constantValues = true;
        functionTypeParameters = true;
        parameterNames = true;
        rangeVariableTypes = true;
      };
      codelenses = {
        test = true;
        generate = true;
        regenerate_cgo = true;
        tidy = true;
        upgrade_dependency = true;
        vendor = false;
        vulncheck = true;
      };
      analyses = {
        unusedparams = true;
        shadow = true;
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
