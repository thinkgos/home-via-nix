{
  config,
  lib,
  pkgs,
  ...
}:
{
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
}
