{ config, pkgs, ... }: {
  # Permite direnv
  programs.direnv.enable = true;

  # SSH
  programs.ssh.startAgent = true;
  programs.ssh.enableAskPassword = false;

  # Fish
  programs.fish.enable = true;
}
