# anyrun 插件配置

| 文件 | 前缀 | 说明 | 使用示例 |
| ------ | ------ | ------ | --------- |
| `applications.ron` | 无 | 应用程序搜索，启用电源操作 | 直接输入应用名 |
| `actions.ron` | 无 | 自定义动作（需在配置中定义） | 直接输入定义的动作名 |
| `websearch.ron` | `?` | 网页搜索 | `? rust async` |
| `translate.ron` | `:t` | 翻译 | `:t zh-CN>en 你好` |
| `symbols.ron` | `:s` | 符号复制 | `:s arrow` |
| `shell.ron` | `>` | Shell 命令执行 | `> htop` |
| `ssh-pattern.ron` | `/` | SSH 连接 | `/ test` |
| `menu-bar.ron` | `:m` | 菜单栏 | `:m a/b` |
