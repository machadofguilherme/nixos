{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tree
    unzip
    pfetch
    yt-dlp
    cowsay
    caprine
    killall
    onlyoffice-bin
    kdePackages.kcalc
    kdePackages.isoimagewriter
    nur.repos.shadowrz.klassy-qt6
  ];
}
