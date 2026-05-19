{
  config,
  lib,
  pkgs,
  customize,
  ...
}:
let
  mkLuaInline = lib.generators.mkLuaInline;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # 锁定状态绑定
      {
        _args = [
          "XF86AudioMute"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')
          {
            locked = true;
            description = "声音关闭/打开";
          }
        ];
      }
      {
        _args = [
          "XF86AudioMicMute"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')
          {
            locked = true;
            description = "麦克风关闭/打开";
          }
        ];
      }
      # 持续性操作 (如音量、亮度调节) 需brightnessctl,wireplumber
      # 声音调整 ✅
      {
        _args = [
          "XF86AudioRaiseVolume"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'')
          {
            locked = true;
            repeating = true;
            description = "音量增加";
          }
        ];
      }
      {
        _args = [
          "XF86AudioLowerVolume"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')
          {
            # locked = true;
            repeating = true;
            description = "音量减少";
          }
        ];
      }
      # 亮度调整 ✅
      {
        _args = [
          "XF86MonBrightnessUp"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.brightnessctl}/bin/brightnessctl -d *backlight* set 5%+")'')
          {
            locked = true;
            repeating = true;
            description = "亮度增加";
          }
        ];
      }
      {
        _args = [
          "XF86MonBrightnessDown"
          (mkLuaInline ''hl.dsp.exec_cmd("${pkgs.brightnessctl}/bin/brightnessctl -d *backlight* set 5%-")'')
          {
            locked = true;
            repeating = true;
            description = "亮度减少";
          }
        ];
      }
      # -- Requires playerctl
      # hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
      # hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
      # hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
      # hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
    ];
  };
}
