{ config, pkgs, ... }: {
  imports = [
    ./plasma.nix
    ./gtk.nix
    #./gnome.nix
    ./fonts.nix
    ./variables.nix
  ];
}
