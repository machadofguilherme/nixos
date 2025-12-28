{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    tree
    unzip
    pfetch
    yt-dlp
    cowsay
    ffmpeg
    killall
  ];
}
