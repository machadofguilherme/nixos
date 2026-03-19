{ config, pkgs, ... }:

let
  portalBackend = "cosmic";
in
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals =
      if portalBackend == "kde" then
        [ pkgs.kdePackages.xdg-desktop-portal-kde ]
      else
        [ pkgs.xdg-desktop-portal-cosmic ];

    config.common.default = [ portalBackend ];
  };

  fonts.fontDir.enable = true;

  services.flatpak.enable = true;
}
