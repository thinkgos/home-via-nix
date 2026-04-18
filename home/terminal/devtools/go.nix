{
  config,
  lib,
  pkgs,
  ...
}:
# gotools,gopls的modernize冲突
# https://github.com/NixOS/nixpkgs/issues/509480
let
  gotoolsWithoutModernize = pkgs.symlinkJoin {
    name = "gotools-without-modernize";
    paths = [ pkgs.gotools ];
    postBuild = ''
      rm -f "$out/bin/modernize"
    '';
  };
in
{
  home.packages = with pkgs; [
    gotoolsWithoutModernize # Additional tools for Go development
    gotests # Generate Go tests from your source code
    impl # Generate method stubs for implementing an interface
    gopls # Official language server for the Go language
    delve # Debugger for the Go programming language
    goperf # Tools and packages for analyzing Go benchmark results
    golangci-lint # Fast linters Runner for Go
    goreleaser # Deliver Go binaries as fast and easily as possible
    wire # 依赖注入
    go-swag # swag
  ];
}
