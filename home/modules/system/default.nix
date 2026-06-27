{ config, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./plasma.nix
    ./variables.nix
  ];
}
