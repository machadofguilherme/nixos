{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    keychain
    firefox
    vivaldi
    vivaldi-ffmpeg-codecs
    unrar
    nix-heuristic-gc
    vulkan-tools
    kdePackages.kde-gtk-config
    kdePackages.qqc2-desktop-style
  ];
}
