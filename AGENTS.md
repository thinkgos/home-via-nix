# AGENTS.md

本指南适用于所有针对 `thinkgos/home-via-nix` 的 AI 辅助贡献，其中介绍了该项目的架构、命令及开发工作流。

## 概览

此代码库包含一个基于 **Nix 的 home-manager 配置**，用于管理不同 Linux 发行版上的用户环境。它使用 **Nix flakes** 来实现可复现性，并采用模块化配置来管理终端和图形环境。该项目结合了：

- **Nix/Home Manager** 用于声明式用户环境管理
- **Ansible roles** 用于系统包、GitHub 应用、Flathub 应用、Python 工具及商业软件安装

## 架构概述

### 项目结构

```text
├── bootstrap.sh              # Ubuntu server 安装 wm 初始化脚本
├── flake.nix                 # Home Manager 主配置入口点
├── flake/                    # Flake 辅助模块
│   ├── hosts.nix             # mkHome 函数及主机配置入口
│   └── overlays.nix          # Nixpkgs overlays
├── hosts/                    # 主机特定配置
│   ├── preset.nix            # 预设配置（theme/icon/cursor/desktop/defaults）
│   ├── thinkgo-laptop.nix    # thinkgo-laptop 主机配置
│   ├── cors-beelink.nix      # cors-beelink 主机配置
│   └── thinkgo-work.nix      # thinkgo-work 主机配置
├── home/                     # Home Manager 主配置目录
│   ├── default.nix           # 基础配置，导入各模块，可选 graphical
│   ├── accounts.nix          # 账户配置
│   ├── assets.nix            # 资源配置
│   ├── fonts.nix             # 字体配置，包括 Nerd Fonts 和 CJK 支持
│   ├── password-store.nix    # 密码存储配置
│   ├── systemd.nix           # 用户会话 PATH 和环境变量
│   ├── ai/                   # CLI AI 工具模块
│   ├── desktop/              # 桌面系统模块
│   │   ├── desktop.nix       # 桌面入口，导入 wm/、terminal/、editor/、programs/ 等
│   │   ├── editor/           # 图形编辑器（zed 等）
│   │   ├── programs/         # 图形程序（obs-studio、yt-dlp、cava、视频剪辑等）
│   │   ├── terminal/         # 终端模拟器（alacritty、ghostty、kitty、wezterm）
│   │   ├── wm/               # 窗口管理器
│   │   │   ├── gnome/        # GNOME 配置
│   │   │   ├── hyprland/     # Hyprland 配置（动画、快捷键、插件等）
│   │   │   ├── niri/         # Niri 配置
│   │   │   ├── wme/          # 窗口管理器环境（hyprland/niri）
│   │   │   └── components/   # 桌面组件（clipboard、launcher、notification、status-bars、wallpaper 等）
│   │   ├── email.nix         # 邮件配置
│   │   ├── gtk.nix           # GTK 主题配置
│   │   ├── qt.nix            # Qt 主题配置
│   │   ├── stylix.nix        # Stylix 全局主题
│   │   ├── i18n.nix          # 国际化配置
│   │   ├── screenshot.nix    # 截图工具
│   │   └── screen-recorder.nix # 屏幕录制
│   ├── devtools/             # 开发工具模块（go、rust、python、cpp）
│   ├── editor/               # 终端编辑器（neovim、vim）
│   ├── fun/                  # 娱乐工具
│   ├── programs/             # CLI 工具（git、ansible、starship、zellij、nix 等）
│   └── shell/                # Shell 配置（zsh、nushell、sh 环境脚本）
├── roles/                    # Ansible roles
│   ├── system/               # 系统包角色
│   ├── github/               # GitHub 应用角色，支持版本跟踪和包/二进制策略
│   ├── flathub/              # Flathub 应用角色
│   ├── python/               # Python 工具角色（通过 uv 安装）
│   ├── npm/                  # npm 全局包角色（通过 npm 安装）
│   └── unfree/               # 商业/非自由软件角色（脚本/URL 安装）
├── overlays/                 # Nixpkgs overlays
├── packages/                 # Nix 包（hvn、ohlib、ohshell、home-assets）
├── npins/                    # Nix pins 依赖管理
├── scripts/                  # 系统脚本（bootstrap、wayland-session、udev-rules 等）
├── docs/                     # 文档目录
│   ├── system/               # 系统文档（issues、keybinding、manual-install）
│   └── terminal/             # 终端文档（keybinding）
├── site.yml                  # Ansible playbook 入口
├── book.toml                 # mdbook 配置
└── renovate.json             # Renovate 依赖更新配置
```

### `home-manager` 结构

- 使用 `flake-parts` 实现模块化 flake 定义。
- 主机配置在 `flake/hosts.nix` 中通过 `mkHome` 函数创建，定义在 `hosts/` 目录下。
- 每个主机配置通过 `lib.recursiveUpdate` 合并 `hosts/preset.nix` 预设值与主机特定覆盖。
- `mkHome` 参数（即 `customize` attrset）：
  - `username`：主目录所有者
  - `theme` / `icon` / `cursor`：全局主题配置（来自 preset.nix）
  - `desktop`：`null` 或 attrset，启用图形模块
    - `window`：窗口管理器类型（如 "hyprland"、"gnome"、"niri"）
    - `window-version`：版本标识符
    - `monitor-primary` / `monitor-secondary`：显示器标识
  - `components`：组件列表（如 "lan-mouse"、"deskflow"）
  - `apps`：应用列表（如 "obs-studio"、"yt-dlp"、"aegisub"）
- 支持的系统：x86_64-linux、aarch64-linux、x86_64-darwin、aarch64-darwin。

### `ansible` 结构

- `roles/system`：系统包角色，`vars/main.yml` 为通用包，`deb.yml` 和 `rpm.yml` 为发行版特定包。
- `roles/github`：GitHub 应用角色，管理 GitHub 应用的安装。
- `roles/flathub`：Flathub 应用角色，管理 Flathub 应用的安装。
- `roles/python`：Python 工具角色，通过 uv 安装和管理 Python 包。
- `roles/npm`：npm 全局包角色，通过 npm 安装和管理 Node.js 全局包。
- `roles/unfree`：商业/非自由软件角色，支持脚本和 URL 两种安装方式。

## 常用工作流指南

### Home Manager 管理
- 切换到用户配置：`home-manager switch --flake .#thinkgo-laptop`（具体查看 `flake/hosts.nix`）
- 仅构建配置（不切换）：`home-manager build --flake .#thinkgo-laptop`
- 查看生成的配置：`home-manager generations`

### Nix Flake 命令
- 更新所有 flake：`nix flake update`
- 显示可用的 flake 输出：`nix flake show`
- 构建特定配置：`nix build .#thinkgo-laptop`

### Ansible 系统包管理
- 前置条件：`home-manager` 已经切换到用户配置，它包含了 `ansible`。
- 运行完整 playbook：`ansible-playbook site.yml -u <用户名> --tags system,github,flathub,python,npm,unfree -K`
- 仅安装系统包：`ansible-playbook site.yml -u <用户名> --tags system -K`
- 仅安装 GitHub 应用：`ansible-playbook site.yml -u <用户名> --tags github -K`
- 仅安装 Flathub 应用：`ansible-playbook site.yml -u <用户名> --tags flathub -K`
- 仅安装 Python 工具：`ansible-playbook site.yml -u <用户名> --tags python -K`
- 仅安装 npm 全局包：`ansible-playbook site.yml -u <用户名> --tags npm -K`
- 仅安装商业软件：`ansible-playbook site.yml -u <用户名> --tags unfree -K`

## 设计模式

1. **模块化导入**：Nix 模块按领域结构化，`default.nix` 条件性导入 `desktop/` 模块。
2. **多用户/多发行版**：单个 flake 通过 `hosts/` 目录下的参数化配置支持多个主机。
3. **预设合并**：主机配置通过 `lib.recursiveUpdate` 合并 `preset.nix` 预设值，实现配置复用。
4. **Ansible + Nix 混合**：Nix 管理用户级包和配置；Ansible 管理系统级包和外部工具安装。
5. **安装策略模式**：GitHub 应用可根据发行版安装为 `.deb`/`.rpm` 包或二进制文件；unfree 软件支持脚本和 URL 安装。
6. **版本固定**：所有外部工具在 Ansible 变量中版本化（无浮动版本）。
7. **幂等性检查**：Ansible 任务在安装前通过包事实或二进制版本检查现有安装。

## 代理特定指导

### 修改 `home-manager` 配置时
- 始终先使用 `home-manager build` 测试，再 `switch`。
- 用户环境更改使用 `home-manager switch`。
- 系统/包更改使用 `ansible-playbook`（需要通过 `-K` 提供 sudo）。

### 更新 `home-manager` 配置依赖时
- 对于 Nix flake 输入：`nix flake update` 然后审查 `flake.lock`。

### 添加新 System 包时
1. 通用包在 `roles/system/vars/main.yml` 中添加条目，发行版特定则在 `roles/system/vars/deb.yml` 或 `roles/system/vars/rpm.yml` 中添加。
2. 运行 `ansible-playbook site.yml -u <用户名> --tags system -K` 进行部署。

### 添加新 Flathub 应用时
1. 在 `roles/flathub/vars/main.yml` 中添加条目，包含必需字段（name、repo、version、tag_prefix）。
2. 运行 `ansible-playbook site.yml -u <用户名> --tags flathub -K` 进行部署。

### 添加新 Python 工具时
1. 在 `roles/python/vars/main.yml` 中添加条目。
2. 运行 `ansible-playbook site.yml -u <用户名> --tags python -K` 进行部署。

### 添加新 npm 全局包时
1. 在 `roles/npm/vars/main.yml` 中添加条目。
2. 运行 `ansible-playbook site.yml -u <用户名> --tags npm -K` 进行部署。

### 添加新商业/非自由软件时
1. 在 `roles/unfree/vars/script.yml`（脚本安装）或 `roles/unfree/vars/url.yml`（URL 安装）中添加条目。
2. 运行 `ansible-playbook site.yml -u <用户名> --tags unfree -K` 进行部署。

### 添加新主机时
1. 在 `hosts/` 目录下创建新的主机配置文件，通过 `lib.recursiveUpdate` 合并 `preset.nix`。
2. 在 `flake/hosts.nix` 中添加 `mkHome` 调用。

### 调试问题时
1. 查看 `docs/system/issues.md` 了解已知问题（SELinux、PATH、XDG_DATA_DIRS、IBus、AppArmor 等）。
2. 检查 home-manager 日志：`journalctl --user -u home-manager`。
3. 验证 Nix 配置：`nix flake check`。
4. 验证 Ansible 时：`ansible localhost -m setup -a 'filter=ansible_*'`。

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
| 安装/更新 Flathub 应用 | `ansible-playbook site.yml -u $USER --tags flathub -K` |
| 安装/更新 Python 工具 | `ansible-playbook site.yml -u $USER --tags python -K` |
| 安装/更新 npm 全局包 | `ansible-playbook site.yml -u $USER --tags npm -K` |
| 安装/更新商业软件 | `ansible-playbook site.yml -u $USER --tags unfree -K` |
| 仅构建配置 | `home-manager build --flake .#<配置名>` |
| 列出可用配置 | `nix flake show` |
