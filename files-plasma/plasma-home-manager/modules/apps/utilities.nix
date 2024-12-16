{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    tree
    unzip
    pfetch
    yt-dlp
    cowsay
    caprine
    killall
    onlyoffice-bin
    gimp-with-plugins
    kdePackages.kcalc
    #kdePackages.kamoso
    inkscape-with-extensions
    kdePackages.isoimagewriter
  ];
}
