{ config, pkgs, ... }: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];

    config.common.default = [ "kde" ];
  };

  fonts.fontDir.enable = true;
  services.flatpak.enable = true;
}
