{ config, pkgs, ... } : {
  environment.gnome.excludePackages = with pkgs; [
    seahorse
    rhythmbox
    simple-scan
    gnome-contacts
    gnome-calendar
  ];
}
