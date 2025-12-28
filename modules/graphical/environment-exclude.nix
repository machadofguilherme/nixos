{ config, pkgs, ... }: {
 environment.gnome.excludePackages = with pkgs; [
     epiphany
     evince
     gnome-calendar
     gnome-contacts
     gnome-music
     gnome-software
     simple-scan
     totem
     geary
  ];
}
