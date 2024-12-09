{ config, pkgs, zen-browser, system, ... }: {
  home.packages = with pkgs; [
    tree
    unzip
    pfetch
    yt-dlp
    caprine
    killall
    gnome-tweaks
    onlyoffice-bin
    gimp-with-plugins
    inkscape-with-extensions
    zen-browser.packages.${system}.specific
  ];
}
