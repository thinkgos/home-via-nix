{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    vcpkg # 微软的C++库管理器
    conan # C++ 包管理器
    clang-tools # clang格式化工具
    ninja # 构建工具
  ];

  home.sessionVariables = {
    # 强制 vcpkg 使用 Nix 提供的工具链，而不是去系统路径乱找
    VCPKG_FORCE_SYSTEM_BINARIES = "1";
    # 建议将 vcpkg 数据存放在用户目录下，避免权限问题
    VCPKG_ROOT = "$HOME/.vcpkg";
  };

  # 创建.vcpkg目录
  #  手动激活环境 "$HOME/.vcpkg/bootstrap-vcpkg.sh", 由于nix限制,
  home.activation = {
    setupVcpkg =
      let
        buildTools = with pkgs; [
          git
          curl
          zip
          unzip
          gnutar
        ];
      in
      ''
        export PATH="${pkgs.lib.makeBinPath buildTools}:$PATH"
        export VCPKG_FORCE_SYSTEM_BINARIES=1

        VCPKG_DIR="$HOME/.vcpkg"

        if [ ! -d "$VCPKG_DIR" ]; then
          git clone https://github.com/microsoft/vcpkg.git "$VCPKG_DIR"
          "$VCPKG_DIR/bootstrap-vcpkg.sh" -disableMetrics
        fi
      '';
  };
}
