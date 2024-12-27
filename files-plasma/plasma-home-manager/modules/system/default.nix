{ config, pkgs, ... }: {
  imports = [
    ./xdg.nix
    ./fonts.nix
    ./variables.nix
  ];
}
