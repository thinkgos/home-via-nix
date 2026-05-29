# anyrun 插件配置

| 文件 | 前缀 | 说明 | 使用示例 |
|------|------|------|---------|
| `applications.ron` | 无 | 应用程序搜索，启用电源操作 | 直接输入应用名 |
| `websearch.ron` | `?` | 网页搜索 | `? rust async` |
| `translate.ron` | `:tr` | 翻译 | `:tr zh-CN>en 你好` |
| `symbols.ron` | `:sy` | 符号复制 | `:sy arrow` |
| `actions.ron` | 无 | 自定义动作（需在配置中定义） | 直接输入定义的动作名 |
| `shell.ron` | `>` | Shell 命令执行 | `> htop` |