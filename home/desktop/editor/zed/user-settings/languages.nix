{
  config,
  lib,
  pkgs,
  ...
}:
{
  "Nix" = {
    language_servers = [
      "!nixd"
      "nil"
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

  "Go" = {
    format_on_save = "on";
    formatter = "language_server";
    code_actions_on_format = {
      "source.organizeImports" = true;
    };
    language_servers = [
      "gopls"
    ];
  };

  "Proto" = {
    format_on_save = "on";
    formatter = "language_server";
    language_servers = [
      "buf"
      "!protols"
      "!protobuf-language-server"
      "..."
    ];
  };
}
