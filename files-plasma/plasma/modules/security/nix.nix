{ config, pkgs, ... }: {
  # Experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 16;

  # Otimiza Store
  nix.settings.auto-optimise-store = true;
}
