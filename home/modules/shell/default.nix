{ config, pkgs, ... }: {
  imports = [
    ./fish.nix
    ./aliases.nix
    ./starship.nix
  ];
}
