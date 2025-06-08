{ config, pkgs, zen-browser, system, ... }:
{
  # Permite Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # Aplicações
  environment.systemPackages = with pkgs; [
    zen-browser.packages."${system}".default
    kdePackages.plasma-browser-integration
    kdePackages.xdg-desktop-portal-kde
    kdePackages.qtstyleplugin-kvantum
    kdePackages.flatpak-kcm
    kdePackages.kcmutils
    kdePackages.sddm-kcm
    qt6.qtwayland
    keychain
    unrar
    nh
  ];
}
