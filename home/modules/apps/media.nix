{ config, pkgs, ... }: {
  # Pacotes de mídia
  home.packages = with pkgs; [
    spotify
    stremio-linux-shell
    discord-development
  ];
}
