{ config, pkgs, ... }: {
  # Oh My Posh
  programs = {
    oh-my-posh = {
      enable = true;
      enableBashIntegration = true;
      useTheme = "jblab_2021";
    };
  };
}
