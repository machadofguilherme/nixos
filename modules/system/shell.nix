{ config, pkgs, ... }: {
  # Fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # SSH
  programs.ssh.enableAskPassword = false;
}
