{ config, pkgs, ... }: {
  imports = [
    ./devtools.nix
    ./media.nix
    ./utilities.nix
  ];
}
