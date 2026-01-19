{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    gotools # Additional tools for Go development
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
