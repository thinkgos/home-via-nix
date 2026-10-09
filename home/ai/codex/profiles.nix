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
    # 开启模型推理摘要，如果设置为false，即使设置了 model_reasoning_effort 也不会生效
    model_supports_reasoning_summaries = true;
    model_reasoning_summary = "none";
    approval_policy = "on-request";
    sandbox_mode = "workspace-write";
    web_search = "disabled";
    model_catalog_json = "model-catalog-mimo.json";
  };
}
