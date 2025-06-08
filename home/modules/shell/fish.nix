{ config, pkgs, lib, ... }:
{
  # Configuração do Fish shell
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      ${pkgs.pfetch}/bin/pfetch

      set -x SSH_ENV "$HOME/.keychain/$hostname-fish"
      if test -f $SSH_ENV
        source $SSH_ENV
      else
        eval (keychain --eval --quiet id_ed25519.pub)
      end
    '';
  };
}
