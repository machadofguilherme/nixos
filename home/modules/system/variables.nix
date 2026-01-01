{ config, pkgs, ... }: {
  # Variáveis de Sessão (Editor padrão)
  home.sessionVariables = {
    EDITOR = "nano";
   # GTK_THEME = "Breeze-Dark";
    #QT_QPA_PLATFORMTHEME = "kde";
   # XDG_CURRENT_DESKTOP = "KDE";
   # XDG_SESSION_DESKTOP = "plasma";
    XCURSOR_THEME = "breeze_cursors";
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST = "aco";
    MOZ_ENABLE_WAYLAND = "1";
    KWIN_TRIPLE_BUFFER = "1";
  };
}
