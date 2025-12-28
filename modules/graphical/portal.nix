{ config, pkgs, ... }:

let
  portalBackend = "kde";
in
{
  xdg.portal = {
    enable = true;

    extraPortals =
      if portalBackend == "kde" then
        [ pkgs.xdg-desktop-portal-kde ]
      else
        [ ];

    config.common.default = [ portalBackend ];
  };

  services.flatpak.enable = true;
}
