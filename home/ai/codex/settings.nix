{
  config,
  lib,
  pkgs,
  ...
}:
{
  model_providers = {
    mimo = {
      name = "Xiaomi MiMo";
      base_url = "https://token-plan-cn.xiaomimimo.com/v1";
      wire_api = "responses";
      env_key = "AI_MIMO_API_KEY";
    };
  };
}
