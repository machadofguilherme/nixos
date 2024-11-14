{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    tree
    unzip
    pfetch
    yt-dlp
    caprine
    killall
    onlyoffice-bin
    gimp-with-plugins
    kdePackages.kcalc
    inkscape-with-extensions
  ];
}
