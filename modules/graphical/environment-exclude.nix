{ config, pkgs, ... } : {
  environment.gnome.excludePackages = with pkgs; [
    seahorse
    simple-scan
    gnome-music
    gnome-contacts
    gnome-calendar
  ];
}
