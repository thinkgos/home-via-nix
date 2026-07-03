{
  config,
  lib,
  pkgs,
  ...
}:
{
  # vicinae 应用启动器
  # https://docs.vicinae.com/
  # https://www.vicinae.com/extensions
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
    };
    settings = {
      close_on_focus_loss = false;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "google";
      search_files_in_root = true;
      font = {
        rendering = "native";
        normal = {
          size = 11;
          family = "JetBrainsMono Nerd Font Mono";
        };
      };
      theme = {
        light = {
          name = "vicinae-light";
          icon_theme = "auto";
        };
        dark = {
          name = "catppuccin-mocha";
          icon_theme = "Catppuccin Latte Mauve";
        };
      };
      launcher_window = {
        opacity = 0.85;
        layer_shell = {
          enabled = false;
        };
      };
    };
    # themes = {};
    # dummy npmDepsHash sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
    extensions = [
      (config.lib.vicinae.mkExtension {
        name = "nix";
        npmDepsHash = "sha256-TEyCCDjAtRYX2uH2TpLfe4/hTzyfMiyDhzVdyQXhEus=";
        src = pkgs.vicinae-extensions + "/extensions/nix";
      })
      (config.lib.vicinae.mkExtension {
        name = "github";
        npmDepsHash = "sha256-7E/dbV6LQaLChriVxP0bvopZpxof5UGrrRBU5lXI9eU=";
        src = pkgs.vicinae-extensions + "/extensions/github";
      })
      # (config.lib.vicinae.mkExtension {
      #   name = "flathub-search";
      #   npmDepsHash = "sha256-kni3hWwg0N3LxypkcAGNqfCZn34WJKthS71W2Df+kgc=";
      #   src = pkgs.vicinae-extensions + "/extensions/flathub-search";
      # })
      (config.lib.vicinae.mkExtension {
        name = "nerdfont-search";
        npmDepsHash = "sha256-SRWqwrWLsBvONOW/mbvxEa0gvoS8qWT4ZDEilGGdG/Y=";
        src = pkgs.vicinae-extensions + "/extensions/nerdfont-search";
      })
      (config.lib.vicinae.mkExtension {
        name = "pass";
        npmDepsHash = "sha256-O+Wfka7rBaLZbGReOWen05M1Qvxd5IVNNC79y71zhmg=";
        src = pkgs.vicinae-extensions + "/extensions/pass";
      })
      (config.lib.vicinae.mkExtension {
        name = "color-converter";
        npmDepsHash = "sha256-EYvMY+NoCm8NaU3pEV5QUYEUkYZZiYXx7eCDD20TzrM=";
        src = pkgs.vicinae-extensions + "/extensions/color-converter";
      })
    ];
  };
}
