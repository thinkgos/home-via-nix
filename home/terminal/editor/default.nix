{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./vim.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    # vim                     # 文本编辑器
    # neovim                  # 文本编辑器
  ];
}
