{ config, pkgs, ... }: {
  imports = [
    ./audio.nix
    ./print.nix
    ./docker.nix
    ./touchpad.nix
    ./gamemode.nix
  ];
}
