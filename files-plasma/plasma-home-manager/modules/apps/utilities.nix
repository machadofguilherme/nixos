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
    #gimp-with-plugins
    kdePackages.kcalc
    #kdePackages.kamoso
    inkscape-with-extensions
    kdePackages.isoimagewriter
    nurPkgs.shadowrz.klassy-qt6
    (opera.override { proprietaryCodecs = true; })
  ];
}
