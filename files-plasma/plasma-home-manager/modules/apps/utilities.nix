{ config, pkgs, ... }:
let
  nurPkgs = pkgs.nur.repos;
in
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
    nurPkgs.shadowrz.klassy-qt6
  ];
}
