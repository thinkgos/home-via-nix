{ config, lib, pkgs, ... }: 
{
  home.packages = with pkgs;[
    cargo-deny          # 检查依赖项
    cargo-udeps         # 检查未使用的依赖
    cargo-shear         # 检测和删除未使用的依赖
    cargo-audit         # 检查依赖项安全
    cargo-tarpaulin     # 测试覆盖率工具
    cargo-expand        # 宏展开
    cargo-nextest       # 并行测试运行器

    cargo-cross         # 跨平台编译Rust程序
    cargo-update        # 检查更新已安装可执行文件
    cargo-zigbuild      # 跨平台编译Rust程序, 使用zig作为后端
    cargo-generate      # 从模板生成Rust项目
    cargo-bloat         # 检查二进制文件中的大依赖项
    cargo-binutils      # llvm二进制工具
    cargo-semver-checks # 检查crate是否符合语义版本规范
    tokio-console       # tokio任务调试工具
  ];
}