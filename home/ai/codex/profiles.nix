{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://mimo.mi.com/docs/zh-CN/tokenplan/integration/codex-configuration
  mimo = {
    model_provider = "mimo";
    model = "mimo-v2.5-pro";
    model_reasoning_effort = "high";
    model_context_window = 1048576;
    model_reasoning_summary = "none";
    approval_policy = "on-request";
    approvals_reviewer = "auto_review";
    sandbox_mode = "workspace-write";
    web_search = "disabled";
    model_catalog_json = "model-catalog-mimo.json";
  };
  # https://api-docs.deepseek.com/zh-cn/quick_start/agent_integrations/codex
  deepseek = {
    model_provider = "deepseek";
    model = "deepseek-flash";
    model_reasoning_effort = "high";
    model_context_window = 1048576;
    model_reasoning_summary = "none";
    approval_policy = "on-request";
    approvals_reviewer = "auto_review";
    sandbox_mode = "workspace-write";
    web_search = "disabled";
    model_catalog_json = "model-catalog-deepseek.json";
    show_raw_agent_reasoning = true;
  };
}
