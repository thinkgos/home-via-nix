{
  config,
  lib,
  pkgs,
  ...
}:
{
  rust-analyzer = {
    initialization_options = {
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
    };
  };
}
