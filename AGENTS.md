# AGENTS.md

本指南适用于所有针对 `thinkgos/home-via-nix` 的 AI 辅助贡献，其中介绍了该项目的架构、命令及开发工作流。

## 概览

此代码库包含一个基于 **Nix 的 home-manager 配置**，用于管理不同 Linux 发行版上的用户环境。它使用 **Nix flakes** 来实现可复现性，并采用模块化配置来管理终端和图形环境。该项目结合了：
- **Nix/Home Manager** 用于声明式用户环境管理
- **Ansible roles** 用于系统包和 GitHub 应用安装

## 架构概述

### 项目结构

```text
├── flake.nix                 # Home Manager 主配置入口点
├── home/                     # Home Manager 主配置目录
│   ├── default.nix           # 基础配置，导入 systemd、fonts、programs、terminal，可选 graphical
│   ├── terminal/             # 终端特定模块（shell、editors、devtools、git、github、ai、ansible）
│   ├── graphical/            # 图形界面模块（窗口管理器、桌面环境、shell、editor）
│   ├── programs.nix          # CLI 工具（eza、ripgrep、bat、fzf 等）
│   ├── fonts.nix             # 字体配置，包括 Nerd Fonts 和 CJK 支持
│   └── systemd.nix           # 用户会话 PATH 和环境变量
├── roles/                    # 用于外部工具安装的 Ansible roles
│   ├── system/               # 系统包角色, 包含发行版特定变量
│   │   ├── task/             # 系统包角色任务
│   │   └── vars/             # 系统包角色变量
│   └── github/               # GitHub应用角色，支持版本跟踪和包/二进制策略
│       ├── task/             # GitHub应用角色任务
│       └── vars/             # GitHub应用角色变量
└── site.yml                  # Ansible playbook入口
```

### `home-manager`结构

- 使用 `flake-parts` 实现模块化 flake 定义。
- 为每个用户-系统组合定义 `legacyPackages.homeConfigurations`。
- 每个配置通过 `mkHome` 函数创建，传递以下参数：
  - `username`：主目录所有者
  - `graphics`：启用图形模块的布尔值
  - `window`：窗口管理器类型（"gnome" 或 "hyprland"）
  - `window-version`：版本标识符（如 "gnome-49"）
- 支持的系统：x86_64-linux、aarch64-linux、x86_64-darwin、aarch64-darwin。

### `ansible` 结构

- `roles/system`：系统包角色, 包含发行版特定变量, 其中vars文件, `main.yml`为通用包, `deb.yml`和`rpm.yml`为发行版特定包。
- `roles/github`： GitHub应用角色, 管理 GitHub 应用的安装。

## 常用工作流指南

### Home Manager 管理
- 切换到用户配置：`home-manager switch --flake .#thinkgo-fedora43` (或 `thinkgo-ubuntu25_10`, `journey-ubuntu25_10`)
- 仅构建配置（不切换）：`home-manager build --flake .#thinkgo-ubuntu25_10`
- 查看生成的配置：`home-manager generations`

### Nix Flake 命令
- 更新所有 flake：`nix flake update`
- 显示可用的 flake 输出：`nix flake show`
- 构建特定配置：`nix build .#thinkgo-fedora43`

### Ansible 系统包管理
- 前置条件: `home-manager` 已经切换到用户配置, 它包含了 `ansible`.
- 运行完整 playbook (system + github)：`ansible-playbook site.yml -u <用户名> -K`
- 仅安装系统包：`ansible-playbook site.yml -u <用户名> --tags system -K`
- 仅安装 GitHub 应用：`ansible-playbook site.yml -u <用户名> --tags github -K`

## 设计模式

1. **模块化导入**：Nix 模块按领域（terminal、graphical、devtools）结构化，并条件性导入。
2. **多用户/多发行版**：单个 flake 通过参数化配置支持多个用户名和发行版。
3. **Ansible + Nix 混合**：Nix 管理用户级包和配置；Ansible 管理系统级包和从 GitHub 发行的二进制安装。
4. **安装策略模式**：GitHub 应用可根据发行版和发行资产安装为 `.deb`/`.rpm` 包或二进制文件。
5. **版本固定**：所有外部工具在 Ansible 变量中版本化（无浮动版本）。
6. **幂等性检查**：Ansible 任务在安装前通过包事实或二进制版本输出版检查现有安装。

## 代理特定指导

### 修改`home-manager`配置时
- 始终先使用 `home-manager build` 测试，再 `switch`。
- 用户环境更改使用 `home-manager switch`。
- 系统/包更改使用 `ansible-playbook`（需要通过 `-K` 提供 sudo）。

### 更新`home-manager`配置依赖时
- 对于 Nix flake 输入：`nix flake update` 然后审查 `flake.lock`。

### 添加新 GitHub 应用时
1. 在 `roles/github/vars/main.yml` 中添加条目，包含必需字段（name、repo、version、tag_prefix）。
2. 确定安装策略：为包提供 `package_name`/`debian_pattern`/`redhat_pattern`，或为二进制提供 `version_arg`/`binaries`/`binary_name`/`binary_pattern`。
3. 运行 `ansible-playbook site.yml --tags github -K` 进行部署。

### 添加新 System 包时
1. 通用包在 `roles/system/vars/main.yml` 中添加条目，发行版特定则在 `roles/system/vars/deb.yml` 或 `roles/system/vars/rpm.yml` 中添加。 
2. 运行 `ansible-playbook site.yml --tags github -K` 进行部署。

### 调试问题时
1. 查看 `docs/system/issues.md` 了解已知问题（SELinux、PATH、XDG_DATA_DIRS、IBus、AppArmor 等）。
2. 检查 home-manager 日志：`journalctl --user -u home-manager`。
3. 验证 Nix 配置：`nix flake check`。
4. 验证 ansible 时：`ansible localhost -m setup -a 'filter=ansible_*'`。

## 注意事项

- Home Manager `stateVersion` 设置为 "25.11"。更新前请阅读发行说明。
- 图形配置依赖于 `targets.genericLinux` 和 `xdg.enable`。
- 某些商业软件（Chrome、VirtualBox、VSCode、Wireshark）必须手动安装（见 `docs/system/manual-install.md`）。

## 快速参考

| 任务 | 命令 |
|------|---------|
| 应用 home 配置 | `home-manager switch --flake .#<配置名>` |
| 更新 flake 输入 | `nix flake update` |
| 安装/更新系统包 | `ansible-playbook site.yml -u $USER --tags system -K` |
| 安装/更新 GitHub 应用 | `ansible-playbook site.yml -u $USER --tags github -K` |
| 仅构建配置 | `home-manager build --flake .#<配置名>` |
| 列出可用配置 | `nix flake show` |
