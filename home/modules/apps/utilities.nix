{ config, pkgs, angrr, ... }:

{
  home.packages = with pkgs; [
    tree
    angrr
    unzip
    pfetch
    typora
    yt-dlp
    cowsay
    caprine
    killall
    hydralauncher
    protonvpn-gui
    kdePackages.kcalc
    wineWowPackages.stable
    onlyoffice-desktopeditors
    kdePackages.isoimagewriter
    nur.repos.shadowrz.klassy-qt6
  ];
}
