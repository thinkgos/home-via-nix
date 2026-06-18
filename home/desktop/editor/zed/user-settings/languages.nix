{
  config,
  lib,
  pkgs,
  ...
}:
{
  "Nix" = {
    language_servers = [
      "nixd"
      "!nil"
    ];
    format_on_save = "on";
    formatter = {
      external = {
        command = "${pkgs.nixfmt}/bin/nixfmt";
        arguments = [
          "--quiet"
          "--"
        ];
      };
    };
  };
  "Shell Script" = {
    format_on_save = "on";
    formatter = {
      external = {
        command = "${pkgs.shfmt}/bin/shfmt";
        arguments = [
          "--filename"
          "{buffer_path}"
        ];
      };
    };
  };
  "TOML" = {
    format_on_save = "on";
    formatter = {
      external = {
        command = "${pkgs.taplo}/bin/taplo";
        arguments = [
          "fmt"
          "-"
        ];
      };
    };
  };
}
