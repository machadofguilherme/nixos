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
      # │ 🔮 Upgrade do sistema      │
      # ╰────────────────────────────╯
      function nix-system-upgrade
         set MAX_COMMITS 10

         echo "🌐 Buscando últimos $MAX_COMMITS commits do nixpkgs..."

         set COMMITS (curl -s "https://api.github.com/repos/NixOS/nixpkgs/commits?sha=nixos-unstable&per_page=$MAX_COMMITS" \
           | jq -r '.[].sha')

         for COMMIT in $COMMITS
            echo ""
            echo "🔮 Testando commit: $COMMIT"

            sudo nixos-rebuild build \
              --override-input nixpkgs github:NixOS/nixpkgs/$COMMIT \
              --impure \
              --flake /etc/nixos#hostname

            if test $status -eq 0
              echo "🧊 Commit estável encontrado: $COMMIT"

              echo "🔒 Atualizando flake.lock..."
              sudo nix flake lock \
                --override-input nixpkgs github:NixOS/nixpkgs/$COMMIT \
                /etc/nixos

              echo "🚀 Aplicando sistema..."
              sudo nixos-rebuild switch \
                --impure \
                --flake /etc/nixos#hostname

              echo "✅ Upgrade concluído com sucesso!"
              return 0
            end

            echo "💥 Commit quebrado, tentando anterior..."
          end

          echo ""
          echo "☠️ Nenhum commit válido encontrado nos últimos $MAX_COMMITS commits"
        return 1
      end

      # ╭────────────────────────────╮
      # │ 🧹 Limpeza completa da Nix │
      # ╰────────────────────────────╯
      function nix-full-clean
         echo "🧹 Iniciando limpeza profunda (Sistema e Usuário)..."
    
         # Remove gerações antigas (Sistema e Usuário)
         sudo nix-collect-garbage -d
         nix-collect-garbage -d
    
         # Remove links mortos e otimiza a store (Hardlinking)
         echo "🔗 Otimizando links da Nix Store..."
         nix-store --gc
         nix-store --optimize
    
         # Suas ferramentas específicas
         if type -q angrr; angrr run; end
         if type -q nix-heuristic-gc; nix-heuristic-gc 20000000000; end
    
         echo "✨ Store limpa e otimizada!"
         echo "📊 Espaço atual em /nix/store:"
         du -sh /nix/store
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
