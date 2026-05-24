{ config, pkgs, zen-browser, system, ... }: {
  programs.anime-game-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    unrar
    cachix
    keychain
    bubblewrap
    vulkan-tools
    catppuccin-kde
    tela-icon-theme
    nix-heuristic-gc
    catppuccin-kvantum
    catppuccin-cursors
    nix-prefetch-github
    kdePackages.qtstyleplugin-kvantum
    nixos-artwork.wallpapers.catppuccin-mocha
    zen-browser.packages."${stdenv.hostPlatform.system}".default
  ];
}
