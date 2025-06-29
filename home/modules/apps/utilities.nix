{ config, pkgs, angrr, ... }:

{
  home.packages = with pkgs; [
    tree
    angrr
    unzip
    pfetch
    yt-dlp
    cowsay
    caprine
    killall
    hydralauncher
    protonvpn-gui
    onlyoffice-bin
    kdePackages.kcalc
    wineWowPackages.stable
    kdePackages.isoimagewriter
    nur.repos.shadowrz.klassy-qt6
  ];
}
