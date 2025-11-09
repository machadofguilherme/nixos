{ config, pkgs, zen-browser, system, ... }:
{
  # Permite Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Permite qtwebengine inseguro
  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];

  # Aplicações
  environment.systemPackages = with pkgs; [
    zen-browser.packages."${system}".twilight
    kdePackages.plasma-browser-integration
    kdePackages.xdg-desktop-portal-kde
    kdePackages.qtstyleplugin-kvantum
    kdePackages.flatpak-kcm
    vivaldi-ffmpeg-codecs
    kdePackages.kcmutils
    kdePackages.sddm-kcm
    nix-heuristic-gc
    qt6.qtwayland
    vulkan-tools
    keychain
    vivaldi
    unrar
  ];
}
