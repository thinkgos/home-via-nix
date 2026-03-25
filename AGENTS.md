# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Overview

This repository contains a Nix-based home-manager configuration for managing user environments across different Linux distributions and macOS. It uses Nix flakes for reproducibility and modular configuration for terminal and graphical environments.

## Common Commands

### Home Manager Management
- Switch to a user configuration: `home-manager switch --flake .#thinkgo-fedora43` (or `thinkgo-ubuntu25_10`, `journey-ubuntu25_10`)
- Build configuration without switching: `home-manager build --flake .#thinkgo-fedora43`
- View generated configurations: `home-manager generations`

### Nix Flake Commands
- Update flake inputs: `nix flake update`
- Show flake outputs: `nix flake show`
- Enter development shell: `nix develop` (empty shell, defined in flake)
- Build a specific home configuration: `nix build .#homeConfigurations.x86_64-linux.thinkgo-fedora43`

### Dotfiles Management
- Apply dotfiles changes with chezmoi: `chezmoi apply -S dotfiles`
- Update mise tools: `mise upgrade --bump --cd dotfiles/dot_config/mise/conf.d`

### System Package Management (Ansible)
- Install required system packages: `ansible-playbook apt.yml -u <username>`

### Development Tasks
- Update mise tools (defined in .mise.toml): `mise upgrade --bump --cd dotfiles/dot_config/mise/conf.d`
- Update dotfiles: `chezmoi apply -S dotfiles`

## Architecture

### Configuration Structure
- `flake.nix`: Entry point defining home configurations for different users and systems (thinkgo-fedora43, thinkgo-ubuntu25_10, journey-ubuntu25_10).
- `home/`: Main configuration directory.
  - `default.nix`: Base configuration importing systemd, fonts, programs, terminal, and optionally graphical modules.
  - `systemd.nix`: Systemd user session variables for Nix profile PATH.
  - `fonts.nix`: Font configuration including CJK and Nerd Fonts.
  - `programs.nix`: Common command-line tools (eza, ripgrep, bat, etc.).
  - `terminal/`: Terminal-specific configurations.
    - `default.nix`: Imports shell, devtools, editor, git, password-store, github, ansible.
    - `shell/`: Shell configurations (zsh, nushell) with starship themes.
    - `devtools/`: Language tools (Go, Rust, C++, Python).
    - `editor/`: Editor configurations (Neovim, Vim).
  - `graphical/`: Graphical environment configurations (imported when `customize.graphics` is true).
    - `default.nix`: Imports i18n, shell, editor, devtools, and window-specific modules (GNOME, Hyprland).
    - `windows/`: Window manager configurations.
    - `shell/`: Graphical shell configurations (Wezterm).
- `dotfiles/`: Dotfiles managed by chezmoi, includes mise configuration.

### Flake Structure
- Uses `flake-parts` for modular flake definition.
- Defines `legacyPackages.homeConfigurations` for each user-system combination (thinkgo-fedora43, thinkgo-ubuntu25_10, journey-ubuntu25_10).
- Each home configuration is created via `mkHome` function that passes `customize` attributes.
- Supports multiple systems: x86_64-linux, aarch64-linux, x86_64-darwin, aarch64-darwin.
- Provides a `devShells.default` (empty) for development environment.

### Customization Parameters
Configurations accept `customize` attribute set with:
- `username`: User name for home directory
- `graphics`: Boolean to enable graphical modules
- `window`: Window manager ("gnome" or "hyprland")
- `window-version`: Version string (e.g., "gnome-49")

### External Tools Integration
- **mise**: Tool version manager for development tools (configured in `dotfiles/dot_config/mise/conf.d/mise.toml`).
- **chezmoi**: Dotfiles manager.
- **ansible**: System package provisioning via `apt.yml`.

### Key Design Patterns
- Conditional imports using `lib.optionals` and `lib.optional` based on `customize` attributes.
- Modular separation of terminal vs graphical configurations.
- Centralized package definitions in respective module's `home.packages`.
- Systemd user session variables fix for Nix profile PATH (see `systemd.nix`).

## Notes

- The repository is designed for multi-user, multi-system support via flake configurations.
- Home configurations are named `thinkgo-fedora43`, `thinkgo-ubuntu25_10`, `journey-ubuntu25_10` and must be referenced fully when using `home-manager switch --flake`.
- Primary documentation (README, ISSUES.md, MANUAL-INSTALL.md) is in Chinese, but configuration files and commands use English.
- Graphical configurations are optional and only imported when `customize.graphics = true`.
- Window manager configurations are conditionally imported based on `customize.window`.
- Issues and manual installation steps are documented in `ISSUES.md` and `MANUAL-INSTALL.md`.
- No automated tests or CI/CD pipelines are defined.
- Some commercial or restricted software must be installed manually (Chrome, VirtualBox, etc.).