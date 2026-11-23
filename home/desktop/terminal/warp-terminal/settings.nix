{
  config,
  lib,
  pkgs,
  ...
}:
{
  privacy = {
    telemetry_enabled = true;
    crash_reporting_enabled = true;
    custom_secret_regex_list = [
      {
        name = "IPv4 Address";
        pattern = ''\b((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}\b'';
      }
      {
        name = "IPv6 Address";
        pattern = ''\b((([0-9A-Fa-f]{1,4}:){1,6}:)|(([0-9A-Fa-f]{1,4}:){7}))([0-9A-Fa-f]{1,4})\b'';
      }
      {
        name = "Slack App Token";
        pattern = ''\bxapp-[0-9]+-[A-Za-z0-9_]+-[0-9]+-[a-f0-9]+\b'';
      }
      {
        name = "Phone Number";
        pattern = ''\b(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\b'';
      }
      {
        name = "AWS Access ID";
        pattern = ''\b(AKIA|A3T|AGPA|AIDA|AROA|AIPA|ANPA|ANVA|ASIA)[A-Z0-9]{12,}\b'';
      }
      {
        name = "MAC Address";
        pattern = ''\b((([a-zA-z0-9]{2}[-:]){5}([a-zA-z0-9]{2}))|(([a-zA-z0-9]{2}:){5}([a-zA-z0-9]{2})))\b'';
      }
      {
        name = "Google API Key";
        pattern = ''\bAIza[0-9A-Za-z-_]{35}\b'';
      }
      {
        name = "Google OAuth ID";
        pattern = ''\b[0-9]+-[0-9A-Za-z_]{32}\.apps\.googleusercontent\.com\b'';
      }
      {
        name = "GitHub Classic Personal Access Token";
        pattern = ''\bghp_[A-Za-z0-9_]{36}\b'';
      }
      {
        name = "GitHub Fine-Grained Personal Access Token";
        pattern = ''\bgithub_pat_[A-Za-z0-9_]{82}\b'';
      }
      {
        name = "GitHub OAuth Access Token";
        pattern = ''\bgho_[A-Za-z0-9_]{36}\b'';
      }
      {
        name = "GitHub User-to-Server Token";
        pattern = ''\bghu_[A-Za-z0-9_]{36}\b'';
      }
      {
        name = "GitHub Server-to-Server Token";
        pattern = ''\bghs_[A-Za-z0-9_]{36}\b'';
      }
      {
        name = "Stripe Key";
        pattern = ''\b(?:r|s)k_(test|live)_[0-9a-zA-Z]{24}\b'';
      }
      {
        name = "Firebase Auth Domain";
        pattern = ''\b([a-z0-9-]){1,30}(\.firebaseapp\.com)\b'';
      }
      {
        name = "JWT";
        pattern = ''\b(ey[a-zA-z0-9_\-=]{10,}\.){2}[a-zA-z0-9_\-=]{10,}\b'';
      }
      {
        name = "OpenAI API Key";
        pattern = ''\bsk-[a-zA-Z0-9]{48}\b'';
      }
      {
        name = "Anthropic API Key";
        pattern = ''\bsk-ant-api\d{0,2}-[a-zA-Z0-9\-]{80,120}\b'';
      }
      {
        name = "Generic SK API Key";
        pattern = ''\bsk-[a-zA-Z0-9\-]{10,100}\b'';
      }
      {
        name = "Fireworks API Key";
        pattern = ''\bfw_[a-zA-Z0-9]{24}\b'';
      }
    ];
  };

  agents = {
    cloud_conversation_storage_enabled = true;
    warp_agent = {
      is_any_ai_enabled = true;
      input = {
        nld_in_terminal_enabled = true;
      };
      other = {
        show_agent_notifications = true;
        show_conversation_history = true;
      };
    };
    third_party = {
      should_render_cli_agent_toolbar = true;
    };
    execution_profiles = {
      default = {
        apply_code_diffs = "agent_decides";
        ask_user_question = "always_ask";
        autosync_plans_to_warp_drive = true;
        command_allowlist = [ ];
        command_denylist = [
          ''bash(\s.*)?''
          ''fish(\s.*)?''
          ''pwsh(\s.*)?''
          ''sh(\s.*)?''
          ''zsh(\s.*)?''
          ''curl(\s.*)?''
          ''eval(\s.*)?''
          ''exec(\s.*)?''
          ''source(\s.*)?''
          ''wget(\s.*)?''
          ''dig(\s.*)?''
          ''nslookup(\s.*)?''
          ''host(\s.*)?''
          ''ssh(\s.*)?''
          ''scp(\s.*)?''
          ''rsync(\s.*)?''
          ''telnet(\s.*)?''
          ''rm(\s.*)?''
        ];
        computer_use = "never";
        directory_allowlist = [ ];
        execute_commands = "always_ask";
        mcp_allowlist = [ ];
        mcp_denylist = [ ];
        mcp_permissions = "agent_decides";
        name = "Default";
        read_files = "agent_decides";
        run_agents = "always_ask";
        web_search_enabled = true;
        write_to_pty = "always_ask";
      };
    };
  };

  account = {
    is_settings_sync_enabled = true;
  };

  terminal = {
    show_terminal_zero_state_block = false;
    maximum_grid_size = 20000;
    input = {
      alias_expansion_enabled = false;
      honor_ps1 = false;
      input_box_type_setting = "universal";
    };
  };

  appearance = {
    spacing = "compact";
    vertical_tabs = {
      enabled = false;
      display_granularity = "tabs";
      view_mode = "compact";
      show_details_on_hover = true;
    };
    window = {
      open_windows_at_custom_size = false;
      override_opacity = 65;
      new_windows_num_rows = 40;
      new_windows_num_columns = 80;
    };
    panes = {
      focus_pane_on_hover = false;
      should_dim_inactive_panes = true;
    };
    full_screen_apps = {
      alt_screen_padding = {
        custom = {
          uniform_padding = 0.0;
        };
      };
    };
    tabs = {
      tab_close_button_position = "right";
      show_indicators_button = false;
      workspace_decoration_visibility = "hide_fullscreen";
    };
    themes = {
      system_theme = false;
      theme = "dark";
    };
    cursor = {
      cursor_display_type = "bar";
    };
    text = {
      match_notebook_to_monospace_font_size = true;
      notebook_font_size = 14.0;
      font_size = 13.0;
      font_name = "JetBrainsMono Nerd Font Mono";
      match_ai_font = true;
      ai_font_name = "JetBrainsMono Nerd Font Mono";
    };
    input = {
      input_mode = "waterfall";
    };
  };

  notifications = {
    toast_duration_secs = 8;
    preferences = {
      is_agent_task_completed_enabled = true;
      is_long_running_enabled = true;
      is_needs_attention_enabled = true;
      is_password_prompt_enabled = true;
      long_running_threshold = 30;
      mode = "enabled";
      play_notification_sound = true;
    };
  };

  warpify = {
    ssh = {
      use_ssh_tmux_wrapper = false;
      enable_legacy_ssh_wrapper = true;
      ssh_tmux_deprecation_notice_pending = false;
    };
    subshells = {
      added_subshell_commands = [ ];
    };
  };

  general = {
    link_tooltip = true;
    default_session_mode = "terminal";
  };

  text_editing = {
    vim_mode_enabled = false;
  };

  system = {
    prefer_low_power_gpu = false;
  };

  warp_drive = {
    enabled = true;
  };

  code = {
    editor = {
      show_global_search = true;
      show_code_review_button = true;
      show_project_explorer = true;
    };
  };
}
