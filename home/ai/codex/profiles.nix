{
  config,
  lib,
  pkgs,
  ...
}:
{
  xiaomi = {
    model = "mimo-v2.5-pro";
    model_reasoning_effort = "high";
    disable_response_storage = true;
    approval_policy = "on-request";
    sandbox_mode = "workspace-write";
    base_url = "https://api.xiaomimimo.com/v1";
    wire_api = "responses";
    requires_openai_auth = false;
  };
}
