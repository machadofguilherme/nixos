{ config, pkgs, ... }: {
  # Aplicações
  environment.systemPackages = with pkgs; [
    vivaldi-ffmpeg-codecs
    blackbox-terminal
    gnome-text-editor
    keychain
    vivaldi
    openssl
    loupe
  ];
}
