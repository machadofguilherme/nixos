{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    tree
    btop
    unzip
    pfetch
    yt-dlp
    cowsay
    ffmpeg
    killall
  ];
}
