{ config, pkgs, zen-browser, system, ... }: {
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
    inkscape-with-extensions
    zen-browser.packages.${system}.specific
  ];
}
