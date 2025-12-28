{ config, pkgs, lib, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Remove mensagem de greeting do Fish
      set -g fish_greeting ""

      # Mostra informações do sistema
      ${pkgs.pfetch}/bin/pfetch

      # ╭────────────────────────────╮
      # │ 🧹 Limpeza completa da Nix  │
      # ╰────────────────────────────╯
      function nix-full-clean
        echo "🧹 Iniciando limpeza completa da Nix Store..."
        sudo nix-collect-garbage --delete-older-than 2d
        nix-collect-garbage --delete-older-than 2d
        nix-store --gc
        nix-store --optimize
        angrr run
        nix-heuristic-gc 20000000000
        echo "✅ Limpeza concluída com sucesso!"
      end

      # ╭────────────────────────────╮
      # │ 🔑 SSH Keychain             │
      # ╰────────────────────────────╯
      set -x SSH_ENV "$HOME/.keychain/$hostname-fish"

      if test -f $SSH_ENV
        source $SSH_ENV
      else
        eval (keychain --eval --quiet id_ed25519.pub)
      end
    '';
  };
}
