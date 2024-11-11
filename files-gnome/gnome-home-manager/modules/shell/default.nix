{ config, pkgs, ... }: {
  imports = [
    ./fish.nix
    ./aliases.nix
    ./oh-my-posh.nix
  ];
}
