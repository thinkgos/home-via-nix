{ config, lib, pkgs, customize, ... }: 
{
  home.packages = with pkgs;[
    # 从系统安装
    # https://extensions.gnome.org
    # gnome-browser-connector 浏览器连接器
    
    gnome-tweaks                                    # 系统设置(可选替代refine)
    # 扩展管理
    # gnome-shell                                     # 扩展管理        
  ] ++lib.optionals (customize.window-version == "gnome-48") [
    # gnomeExtensions.user-themes                     # 用户主题
    # gnomeExtensions.auto-move-windows               # 自动移动窗口
    gnomeExtensions.tophat                          # 系统资源监控
    gnomeExtensions.gnome-40-ui-improvements        # GNOME 40界面改进
    gnomeExtensions.kimpanel                        # 输入法面板
    gnomeExtensions.appindicator                    # 应用程序指示器
    gnomeExtensions.clipboard-indicator             # clipboard管理
    gnomeExtensions.tiling-shell                    # 平铺窗口
    gnomeExtensions.dash-to-dock                    # 任务栏
    gnomeExtensions.compiz-alike-magic-lamp-effect  # 仿Compiz的魔法灯效果
    # gnomeExtensions.compiz-windows-effect           # 仿Compiz的窗口特效
    gnomeExtensions.open-bar                        # top bar
    gnomeExtensions.blur-my-shell
  ] ;

  
  # NOTE: 扩展配置位于 gnome-dconf.nix
  programs = {
    gnome-shell = lib.mkIf (customize.window-version == "gnome-49") {
      enable = true;
      # 主题单独配置
      # 使用的是 gnome-shell-extensions 包含多种扩展
      # - user-themes 用户主题
      # - auto-move-windows 自动移动窗口
      theme = {
        name = "WhiteSur-Dark";
        package = pkgs.whitesur-gtk-theme;
      };
      extensions = with pkgs;[
        # 系统资源监控
        { package = gnomeExtensions.tophat; }
        # GNOME 40界面改进
        { package = gnomeExtensions.gnome-40-ui-improvements; }
        # 输入法面板
        { package = gnomeExtensions.kimpanel; }
        # 应用程序指示器
        { package = gnomeExtensions.appindicator; }
        # clipboard管理
        { package = gnomeExtensions.clipboard-indicator; }
        # 平铺窗口
        { package = gnomeExtensions.tiling-shell; }
        # 任务栏
        { package = gnomeExtensions.dash-to-dock; }
        # 仿Compiz的魔法灯效果
        { package = gnomeExtensions.compiz-alike-magic-lamp-effect; }
        # 仿Compiz的窗口特效
        { package = gnomeExtensions.compiz-windows-effect; }
        # top bar
        # { package = gnomeExtensions.open-bar; }
        # 模糊窗口
        { package = gnomeExtensions.blur-my-shell; }
      ];
    };
  };
}