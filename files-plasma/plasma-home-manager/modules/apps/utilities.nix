{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    tree
    unzip
    pfetch
    yt-dlp
    caprine
    killall
    # Apps KDE se necessários.
    onlyoffice-bin
    gimp-with-plugins
    inkscape-with-extensions
  ];
}
