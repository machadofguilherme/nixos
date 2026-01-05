{ config, pkgs, ... }: {
  imports = [
    ./menu.nix
    ./media.nix
    ./firefox.nix
    ./devtools.nix
    ./utilities.nix
  ];
}
