{ config, pkgs, ... }: {
  imports = [
    ./cli.nix
    ./user.nix
    ./warp.nix
    ./fonts.nix
    ./shell.nix
    ./gaming.nix
    ./keyboard.nix
    ./packages.nix
	];
}
