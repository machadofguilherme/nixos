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
      # │ 🧹 Limpeza completa da Nix │
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
      # │ 🎮 Ativando o Modo Genshin │
      # ╰────────────────────────────╯
      function genshin-on
        echo "🎮 Ativando Modo Genshin..."
        
        echo "⏸️  Pausando auto-cpufreq"
        sudo systemctl stop auto-cpufreq.service

        echo "⚙️  Ajustando CPU para performance"
        sudo cpupower frequency-set -g performance

        if test -e /sys/devices/system/cpu/cpufreq/boost
          echo 1 | sudo tee /sys/devices/system/cpu/cpufreq/boost > /dev/null
        end

        echo "🧠 Desativando OOM agressivo"
        sudo systemctl stop earlyoom.service
        sudo systemctl stop systemd-oomd.service

        echo "🟢 Sistema pronto. Abra o An Anime Game Launcher e jogue."
      end

      # ╭────────────────────────────────╮
      # │ 🎮 Desativando o Modo Genshin  │
      # ╰────────────────────────────────╯
      function genshin-off
        echo "🧘 Desativando Modo Genshin..."

        echo "▶️  Retomando auto-cpufreq"
        sudo systemctl start auto-cpufreq.service

        echo "⚙️  Restaurando governor"
        sudo cpupower frequency-set -g schedutil

        if test -e /sys/devices/system/cpu/cpufreq/boost
          echo 0 | sudo tee /sys/devices/system/cpu/cpufreq/boost > /dev/null
        end

        echo "🧠 Reativando OOM"
        sudo systemctl start systemd-oomd.service
        sudo systemctl start earlyoom.service

        echo "🔵 Sistema restaurado ao normal."
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
