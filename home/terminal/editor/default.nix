{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./vim.nix
  ];

  home.packages = with pkgs; [
    # vim                     # 文本编辑器
  ];
}
