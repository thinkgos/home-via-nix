{
  config,
  lib,
  pkgs,
  ...
}:
{
  SessionStart = [ ];
  PreToolUse = [
    {
      matcher = "^Bash$";
      hooks = [
        {
          type = "command";
          command = "${pkgs.rtk}/bin/rtk hook claude";
          timeout = 30;
          statusMessage = "Running rtk command";
        }
      ];
    }
  ];
  PostToolUse = [ ];
}
