{ config, pkgs, ... }: {
  imports = [
    ./plasma.nix
    ./server.nix
    ./drivers.nix
		./exclude-plasma.nix
	];
}
