{ config, pkgs, ... }: {
	imports = [
		./net.nix
		./dns.nix
	];
}
