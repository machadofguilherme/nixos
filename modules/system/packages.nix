{ config, pkgs, ... }: {
  programs.firefox = {
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

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
