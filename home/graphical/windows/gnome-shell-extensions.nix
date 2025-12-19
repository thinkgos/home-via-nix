{ config, lib, pkgs, ... }: 
{
  home.packages = with pkgs;[
    # 从系统安装
    # https://extensions.gnome.org
    # gnome-browser-connector 浏览器连接器系统安装
    
    gnome-tweaks                                    # 系统设置(可选替代refine)
    # 扩展管理
    # gnome-shell                                     # 扩展管理        
  ];

  # NOTE: 扩展配置位于 gnome-dconf.nix
  programs.gnome-shell = {
    enable = true;
    # 主题单独配置(目前暂时在dconf配置, 不兼容gnome49)
    # 便用的是 gnome-shell-extensions 包含user-themes, auto-move-windows 多种扩展
    # theme = {
    #   name = "WhiteSur-Dark";
    #   package = pkgs.whitesur-gtk-theme;
    # };
    extensions = with pkgs;[
      # 用户主题
      # { package = gnomeExtensions.user-themes; }
      # 自动移动窗口
      # { package = gnomeExtensions.auto-move-windows; }
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
      # { package = gnomeExtensions.compiz-windows-effect; }
      # top bar
      # { package = gnomeExtensions.open-bar; }
      # 模糊窗口
      { package = gnomeExtensions.blur-my-shell; }
    ];
  };
}