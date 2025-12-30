{ config, pkgs, ... }: {
  imports = [
    ./menu.nix
    ./media.nix
    ./devtools.nix
    ./utilities.nix
  ];
}
