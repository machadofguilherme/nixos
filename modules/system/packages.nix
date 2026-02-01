{ config, pkgs, ... }: {
  programs.firefox = {
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  programs.anime-game-launcher.enable = true;
  programs.anime-games-launcher.enable = true;

  environment.systemPackages = with pkgs; [
    keychain
    firefox
    bubblewrap
    unrar
    nix-heuristic-gc
    vulkan-tools
    gamescope
    linuxKernel.packages.linux_6_12.cpupower
  ];
}
