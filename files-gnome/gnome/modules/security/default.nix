{ config, pkgs, ... }: {
  imports = [
    ./sudo.nix
    ./nix.nix
  ];
}
