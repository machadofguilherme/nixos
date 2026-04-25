{ config, pkgs, ... }: {
  # Farme de Cartas
  services.archisteamfarm.enable = true;

  # GameMode
  programs.gamemode.enable = true;

  # Gamescope
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  # Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };  

  environment.systemPackages = with pkgs; [
    heroic
    lsfg-vk-ui
    protonup-qt
    vkd3d-proton
    hydralauncher
    archisteamfarm
    faugus-launcher
  ];
}
