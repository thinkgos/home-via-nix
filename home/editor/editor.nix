{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./zed.nix
    ./vim.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    # vim           # 文本编辑器
    # neovim        # 文本编辑器
    # zed           # 代码编辑器
  ];
}
