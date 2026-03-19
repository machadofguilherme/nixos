{ config, pkgs, ... }: {
  imports = [
    ./warp.nix
    ./audio.nix
    ./print.nix
    ./docker.nix
    ./touchpad.nix
  ];
}
