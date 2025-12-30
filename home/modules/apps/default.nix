{ config, pkgs, ... }: {
  imports = [
    ./menu.nix
    ./media.nix
    ./devtools.nix
    ./twintail.nix
    ./utilities.nix
  ];
}
