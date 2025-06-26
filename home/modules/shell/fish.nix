{ config, pkgs, lib, ... }:
{
  # Configuração do Fish shell
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      ${pkgs.pfetch}/bin/pfetch

      function nix-full-clean
        echo "🧹 Iniciando limpeza completa da Nix Store..."
        sudo nix-collect-garbage --delete-older-than 2d
        nix-store --gc
        nix-store --optimize
        nix run github:linyinfeng/angrr -- run --period 2d
        sudo nix run github:linyinfeng/angrr -- run --period 2d --owned-only=false
        nix-heuristic-gc 20000000000
        echo "✅ Limpeza concluída com sucesso!"
      end

      set -x SSH_ENV "$HOME/.keychain/$hostname-fish"
      if test -f $SSH_ENV
        source $SSH_ENV
      else
        eval (keychain --eval --quiet id_ed25519.pub)
      end
    '';
  };
}
