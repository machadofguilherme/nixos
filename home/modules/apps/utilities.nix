{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    tree
    btop
    inxi
    unzip
    p7zip
    pfetch
    yt-dlp
    cowsay
    ffmpeg
    killall
    lm_sensors
    ventoy-full-qt
    kdePackages.kamoso
  ];
}
