{ config, pkgs, ... }: {
  imports = [
    ./gnome.nix
    ./fonts.nix
    ./variables.nix
  ];
}
