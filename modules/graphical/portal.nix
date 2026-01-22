{ config, pkgs, ... }:

let
  portalBackend = "gnome";
in
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals =
      if portalBackend == "kde" then
        [ pkgs.kdePackages.xdg-desktop-portal-kde ]
      else
        [ pkgs.xdg-desktop-portal-gnome ];

    config.common.default = [ portalBackend ];
  };

  fonts.fontDir.enable = true;

  services.flatpak.enable = true;
}
