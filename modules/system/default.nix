{ config, pkgs, ... }: {
  imports = [
    ./cli.nix
    ./user.nix
    ./fonts.nix
    ./shell.nix
    ./gaming.nix
    ./keyboard.nix
    ./packages.nix
	];
}
