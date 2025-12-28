{ config, pkgs, ... }:

let
  portalBackend = "kde";
in
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals =
      if portalBackend == "kde" then
        [ pkgs.kdePackages.xdg-desktop-portal-kde ]
      else
        [ ];

    config.common.default = [ portalBackend ];
  };

  services.flatpak.enable = true;
}
