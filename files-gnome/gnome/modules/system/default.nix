{ config, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./user.nix
    ./packages.nix
	];
}
