{ config, pkgs, zen-browser, system, ... }: {
  programs.anime-game-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    unrar
    cachix
    keychain
    bubblewrap
    vulkan-tools
    nix-heuristic-gc
    nix-prefetch-github
    kdePackages.qtstyleplugin-kvantum
    zen-browser.packages."${stdenv.hostPlatform.system}".default
  ];
}
