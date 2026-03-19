{ config, pkgs, ... }: {
  imports = [
    ./cli.nix
    ./user.nix
    ./zram.nix
    ./fonts.nix
    ./shell.nix
    ./gaming.nix
    ./keyboard.nix
    ./packages.nix
	];
}
