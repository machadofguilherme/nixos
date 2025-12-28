{ config, pkgs, ... }: {
  imports = [
    ./plasma.nix
    #./gnome.nix
    ./fonts.nix
    ./variables.nix
  ];
}
