{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    stremio
    discord-development
  ];
}
