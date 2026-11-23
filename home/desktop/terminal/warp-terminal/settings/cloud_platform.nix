{
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://docs.warp.dev/terminal/settings/all-settings/#cloud-platform
  #
  # https://docs.warp.dev/terminal/settings/all-settings/#third-party-api-keys
  third_party_api_keys = {
    aws_bedrock_credentials_enabled = false; # 是否使用本地 AWS 凭据进行 Bedrock 请求 (默认: false)
    aws_bedrock_profile = "default"; # Bedrock 凭据使用的 AWS profile 名称 (默认: "default")
    aws_bedrock_auto_login = false; # Bedrock 凭据过期时是否自动执行 AWS 登录命令 (默认: false)
    aws_bedrock_auth_refresh_command = "aws login"; # 刷新 Bedrock AWS 凭据的命令 (默认: "aws login")
    gemini_enterprise_credentials_enabled = false; # 是否通过工作区的 Gemini Enterprise Google Cloud 项目路由请求, 需管理员配置 (默认: false)
    can_use_warp_credits_with_byok = false; # 自带 API key(BYOK) 时是否可使用 Warp 推理额度 (默认: false)
  };
}
