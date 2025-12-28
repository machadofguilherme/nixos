{ config, pkgs, ... }:

let
  portalBackend = "gnome";
in
{
  xdg.portal = {
    enable = true;

    extraPortals =
      if portalBackend == "gnome" then
        [ pkgs.xdg-desktop-portal-gnome ]
      else
        [ ];

    config.common.default = [ portalBackend ];
  };

  services.flatpak.enable = true;
}
