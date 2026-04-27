{
  config,
  lib,
  pkgs,
  ...
}:
{
  # 屏幕锁定
  # https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/
  # https://github.com/mahaveergurjar/Hyprlock-Dots
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock.overrideAttrs (oldAttrs: {
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.patchelf ];
      postFixup = ''
        file="$out/bin/hyprlock"
        patchelf --replace-needed libpam.so.0 /usr/lib/x86_64-linux-gnu/libpam.so.0 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libaudit.so.1 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcap-ng.so.0 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcrypt.so.1 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libpam_misc.so.0 "$file"
        patchelf --add-needed /usr/lib/x86_64-linux-gnu/libcap.so.2 "$file"
      '';
    });
    settings = {
      "$font" = "FiraCode Nerd Font Mono";
      "$splash" = "echo $(hyprctl splash)";
      "$wallpaper" = "${config.xdg.dataHome}/wallpapers/scenery3.png";
      "$greet" =
        ''echo "Good $(date +%H | awk '{if ($1 < 10) print "morning"; else if ($1 < 13) print "noon"; else if ($1 < 18) print "afternoon"; else if ($1 < 22) print "evening"; else print "night"}'), $(echo ''${USER})"'';

      general = {
        grace = 3;
        hide_cursor = false;
        ignore_empty_input = true;
        text_trim = true;
      };
      # uncomment to enable fingerprint authentication
      # auth = {
      #   fingerprint = {
      #     enabled = true;
      #     ready_message = "Scan fingerprint to unlock";
      #     present_message = "Scanning...";
      #     retry_delay = 250; # in milliseconds
      #   };
      # };

      animations = {
        enabled = true;
        bezier = "linear, 1, 1, 0, 0";
        animation = [
          "fadeIn, 1, 5, linear"
          "fadeOut, 1, 5, linear"
          "inputFieldDots, 1, 2, linear"
        ];
      };
      background = {
        monitor = "";
        path = "$wallpaper";
        blur_passes = 3; # 0 disables blurring
        blur_size = 2;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      input-field = {
        monitor = "";
        size = "20%, 5%";
        outline_thickness = 3;
        dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
        outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        inner_color = "rgba(0,0,0,0.9)";
        font_color = "rgba(255,255,255,0.9)";
        fade_on_empty = true;
        fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
        placeholder_text = "<i>  Logged in as </i>$USER";
        hide_input = false;
        rounding = -1; # -1 means complete rounding (circle/oval)
        check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
        fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg"; # if authentication failed, changes outer_color and fail message color
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail_transition = 300; # transition time in ms between normal outer_color and fail_color
        capslock_color = 1;
        numlock_color = 1;
        bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false; # change color if numlock is off
        swap_font_color = true; # see below
        position = "0, -150";
        halign = "center";
        valign = "center";
      };

      label = [
        # TIME
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(122,131,194,0.9)";
          font_size = 160;
          font_family = "$font";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # DATE
        {
          monitor = "";
          text = "cmd[update:60000] date +'%Y-%m-%d %A'";
          color = "rgba(122,131,194,0.9)";
          font_size = 40;
          font_family = "$font";
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
        # DAY
        # {
        #   monitor = "";
        #   text = "cmd[update:60000] date +'%A'";
        #   color = "rgba(100,87,143,0.9)";
        #   font_size = 40;
        #   font_family = "$font";
        #   position = "550, 180";
        #   halign = "center";
        #   valign = "center";
        # }
        # USER
        {
          monitor = "";
          text = "cmd[update:60000] $greet";
          color = "rgba(154,163,230,0.9)";
          font_size = 30;
          font_family = "$font";
          position = "0, -50";
          halign = "center";
          valign = "center";
        }
        # SPLASH
        {
          monitor = "";
          text = "cmd[update:60000] $splash";
          color = "rgba(138, 99, 205, 0.9)";
          font_family = "$font";
          position = "0, 0";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
