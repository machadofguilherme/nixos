{ config, pkgs, ... }: {
  imports = [
    ./firefox
    ./menu.nix
    ./media.nix
    ./devtools.nix
    ./utilities.nix
  ];
}
