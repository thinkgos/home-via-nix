{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = customize.username;
  home.homeDirectory = "/home/${customize.username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };

  imports = [
    ./systemd.nix
    ./fonts.nix
    ./programs.nix
    ./terminal
  ]
  ++ lib.optionals customize.graphics [
    ./graphical
    ./fun
  ];

  targets.genericLinux = {
    enable = true;
    gpu.enable = true;
  };

  xdg = {
    enable = true;
    mime.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Templates";
      videos = "${config.home.homeDirectory}/Videos";
      extraConfig = {
        program = "${config.home.homeDirectory}/Programs";
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #! terminal 统一管理终端应用
    #! graphical 统一管理图形化应用

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1; # Chromium 内核应用 使用 Wayland
    MOZ_ENABLE_WAYLAND = 1; # Mozilla 系应用 使用 Wayland
    GDK_BACKEND = "wayland,x11,*"; # GTK 框架应用 使用 Wayland
    SDL_VIDEODRIVER = "wayland"; # 游戏及多媒体应用 使用 Wayland
    CLUTTER_BACKEND = "wayland"; # Clutter 框架应用 使用 Wayland
    # XDG
    XDG_CURRENT_DESKTOP = if customize.window == "hyprland" then "Hyprland" else "GNOME";
    XDG_SESSION_TYPE = "wayland"; # 系统级中间件和桌面环境 使用 Wayland
    XDG_SESSION_DESKTOP = if customize.window == "hyprland" then "Hyprland" else "GNOME";
    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORMTHEME = "qt5ct";

    BAT_PAGER = "less -r";
    TMPDIR = "$HOME/.cache/tmp";
  };

  # Create TMPDIR if it doesn't exist
  home.activation.createTmpDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.cache/tmp"
  '';

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };
}
