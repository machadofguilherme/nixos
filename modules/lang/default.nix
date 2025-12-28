{ config, pkgs, ... }: {
  imports = [
    ./locale.nix
    ./timezone.nix
  ];
}
