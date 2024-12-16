{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    stremio
    kdePackages.dragon
    discord-development
  ];
}
