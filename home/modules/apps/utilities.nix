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
    zapzap
    killall
    lm_sensors
    kdePackages.kamoso
  ];
}
