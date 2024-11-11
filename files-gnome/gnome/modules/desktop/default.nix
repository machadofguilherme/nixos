{ config, pkgs, ... }: {
  imports = [
    ./gnome.nix
    ./server.nix
    ./drivers.nix
		./exclude-gnome.nix
	];
}
