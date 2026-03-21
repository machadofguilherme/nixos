{ config, pkgs, ... }: {
  # GameMode
  programs.gamemode.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };  

  environment.systemPackages = with pkgs; [
    heroic
    hydralauncher
  ];
}
