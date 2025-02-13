{ config, pkgs, ... }: {
  # Pacotes de mídia
  home.packages = with pkgs; [
    spotify
    stremio
    kdePackages.dragon
    discord-development
  ];
}
