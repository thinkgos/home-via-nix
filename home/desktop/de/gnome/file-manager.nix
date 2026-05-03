{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.dataFile = {
    "nautilus/scripts/open-in-kitty" = {
      executable = true;
      text = ''
        #!/bin/bash

        # 获取选中的路径（如果没有选中文件，则使用当前文件夹）
        SELECTED_PATH=''${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS%%$'\n'*}
        TARGET_DIR="''${SELECTED_PATH:-$PWD}"

        # 如果选中的是文件，则获取其所在目录
        if [ -f "$TARGET_DIR" ]; then
            TARGET_DIR=$(dirname "$TARGET_DIR")
        fi

        # 调用 kitty 在该目录下打开
        # --hold 参数的作用是：即使命令执行完了，窗口也不会立即关闭
        kitty --directory "$TARGET_DIR"
      '';
    };

    "nautilus/scripts/open-in-ghostty" = {
      executable = true;
      text = ''
        #!/bin/bash

        # 获取选中的路径（如果没有选中文件，则使用当前文件夹）
        SELECTED_PATH=''${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS%%$'\n'*}
        TARGET_DIR="''${SELECTED_PATH:-$PWD}"

        # 如果选中的是文件，则获取其所在目录
        if [ -f "$TARGET_DIR" ]; then
            TARGET_DIR=$(dirname "$TARGET_DIR")
        fi

        # 调用 ghostty 在该目录下打开
        ghostty --working-directory="$TARGET_DIR"
      '';
    };
  };
}
