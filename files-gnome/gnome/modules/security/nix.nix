{ config, pkgs, ... }: {
  # Experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 16;

  # Limpeza e Otimização da Store
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  # Permite nh.
  programs.nh.enable = true;
  programs.nh.clean.enable = true;
  programs.nh.clean.extraArgs = "--keep-since 1d --keep 2";

  # Permite pacotes Steam
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
    "steam-original"
    "steam-run"
  ];
}
