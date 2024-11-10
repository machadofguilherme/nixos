{ config, pkgs, ... }: {
  # Exclui pacotes do GNOME
  environment.gnome.excludePackages = (with pkgs; [
    gnome-software
    gnome-contacts
    gnome-calendar
    gnome-console
    gnome-photos
    simple-scan
    gnome-music
    gnome-tour
    hitori
    atomix
    geary
    totem
    iagno
    tali
    yelp
  ]);
}
