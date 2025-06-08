{ config, pkgs, ... }: {
  imports = [
    ./shell.nix
    ./audio.nix
    ./print.nix
    ./virtual.nix
    ./touchpad.nix
  ];
}
