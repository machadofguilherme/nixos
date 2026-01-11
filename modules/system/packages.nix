{ config, pkgs, ... }: {
  programs.firefox = {
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  environment.systemPackages = with pkgs; [
    keychain
    firefox
    unrar
    nix-heuristic-gc
    vulkan-tools
    kdePackages.kde-gtk-config
    kdePackages.qqc2-desktop-style
  ];
}
