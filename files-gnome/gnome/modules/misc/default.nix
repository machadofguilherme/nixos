{ config, pkgs, ... }: {
	imports = [
		./config.nix
		./dev.nix
	];
}
