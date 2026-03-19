{ config, pkgs, ... }: {
  # Pacotes de mídia
  home.packages = with pkgs; [
    spotify
    discord-development
  ];
}
