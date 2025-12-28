{ config, pkgs, ... }: {
  imports = [
    ./nix.nix
    ./sudo.nix
    ./unfree.nix
  ];
}
