{ config, pkgs, ... }: {
  # Aplicações
  environment.systemPackages = with pkgs; [
    kdePackages.plasma-browser-integration
    vivaldi-ffmpeg-codecs
    qt6.qtwayland
    keychain
    vivaldi
    openssl
  ];
}
