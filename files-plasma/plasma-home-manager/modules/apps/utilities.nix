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
    materia-kde-theme
    gimp-with-plugins
    kdePackages.kcalc
    #kdePackages.kamoso
    inkscape-with-extensions
    kdePackages.isoimagewriter
    nurPkgs.shadowrz.klassy-qt6
    python312Packages.kde-material-you-colors
  ];
}
