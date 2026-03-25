{ config, pkgs, zen-browser, system, ... }: {
  programs.anime-game-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    unrar
    cachix
    keychain
    gamescope
    bubblewrap
    vulkan-tools
    nix-heuristic-gc
    zen-browser.packages."${system}".default
  ];
}
