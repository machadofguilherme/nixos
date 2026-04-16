{ config, pkgs, ... }: {
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
    vkd3d-proton
    hydralauncher
    faugus-launcher
  ];
}
