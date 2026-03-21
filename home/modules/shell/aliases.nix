{ config, pkgs, ... }: {
  programs.fish = {
    shellAliases = {

      # ╭────────────────────────────╮
      # │ 🔄  ATUALIZAÇÃO DO SISTEMA │
      # ╰────────────────────────────╯
      nix-update-flake = "sudo nix flake update --flake /etc/nixos";
      nix-rebuild        = "sudo nixos-rebuild switch --impure --flake /etc/nixos#hostname";
      nix-system-upgrade = "nix-update-flake && nix-rebuild";

      # ╭─────────────────────────────────────────╮
      # │ 🧹 Limpeza inteligente da Nix Store     │
      # ╰─────────────────────────────────────────╯
      angrr-clean       = "angrr run --period 2d";
      angrr-clean-all   = "sudo angrr run --period 2d --owned-only=false";
      nix-gc            = "sudo nix-collect-garbage --delete-older-than 2d";
      nix-hgc           = "nix-heuristic-gc 20000000000";

      # ╭────────────────────────────╮
      # │ 🛠️  CONFIGS PRINCIPAIS      │ 
      # ╰────────────────────────────╯
      cfg-system  = "nano /etc/nixos/configuration.nix";
      cfg-flake   = "nano /etc/nixos/flake.nix";
      hm-home     = "nano /etc/nixos/home/home.nix";

      # ╭────────────────────────────╮
      # │ 🧩  MÓDULOS: SYSTEM        │
      # ╰────────────────────────────╯
      cfg-system-mod         = "nano /etc/nixos/modules/system/default.nix";
      cfg-packages           = "nano /etc/nixos/modules/system/packages.nix";
      cfg-fonts              = "nano /etc/nixos/modules/system/fonts.nix";
      cfg-user               = "nano /etc/nixos/modules/system/user.nix";
      cfg-shell              = "nano /etc/nixos/modules/system/shell.nix";
      cfg-gaming             = "nano /etc/nixos/modules/system/gaming.nix";

      # ╭────────────────────────────╮
      # │ 🌐  MÓDULOS: NETWORK       │
      # ╰────────────────────────────╯
      cfg-network-mod = "nano /etc/nixos/modules/network/default.nix";
      cfg-net         = "nano /etc/nixos/modules/network/net.nix";
      cfg-dns         = "nano /etc/nixos/modules/network/dns.nix";

      # ╭────────────────────────────╮
      # │ 🌍  MÓDULOS: LANG          │
      # ╰────────────────────────────╯
      cfg-lang     = "nano /etc/nixos/modules/lang/default.nix";
      cfg-locale   = "nano /etc/nixos/modules/lang/locale.nix";
      cfg-timezone = "nano /etc/nixos/modules/lang/timezone.nix";

      # ╭────────────────────────────╮
      # │ 🔐  MÓDULOS: SECURITY      │
      # ╰────────────────────────────╯
      cfg-security = "nano /etc/nixos/modules/security/default.nix";
      cfg-nix      = "nano /etc/nixos/modules/security/nix.nix";
      cfg-sudo     = "nano /etc/nixos/modules/security/sudo.nix";
      cfg-unfree   = "nano /etc/nixos/modules/security/unfree.nix";
      cfg-ulimit   = "nano /etc/nixos/modules/security/ulimit.nix";

      # ╭────────────────────────────╮
      # │ 🖥️  MÓDULOS: GRAPHICAL      │
      # ╰────────────────────────────╯
      cfg-graphical = "nano /etc/nixos/modules/graphical/default.nix";
      cfg-base      = "nano /etc/nixos/modules/graphical/base.nix";
      cfg-drivers   = "nano /etc/nixos/modules/graphical/drivers.nix";
      cfg-environment = "nano /etc/nixos/modules/graphical/environment.nix";
      cfg-environment-exclude = "nano /etc/nixos/modules/graphical/environment-exclude.nix";
      cfg-portal    = "nano /etc/nixos/modules/graphical/portal.nix";

      # ╭────────────────────────────╮
      # │ 🧩  MÓDULOS: PERFORMANCE   │
      # ╰────────────────────────────╯
      cfg-performance     = "nano /etc/nixos/modules/performance/default.nix";
      cfg-amd-notebook    = "nano /etc/nixos/modules/performance/amd-notebook.nix";

      # ╭────────────────────────────╮
      # │ ⚙️  MÓDULOS: SERVICES       │
      # ╰────────────────────────────╯
      cfg-services  = "nano /etc/nixos/modules/services/default.nix";
      cfg-audio     = "nano /etc/nixos/modules/services/audio.nix";
      cfg-print     = "nano /etc/nixos/modules/services/print.nix";
      cfg-touchpad  = "nano /etc/nixos/modules/services/touchpad.nix";
      cfg-docker    = "nano /etc/nixos/modules/services/docker.nix";
      cfg-gamemode  = "nano /etc/nixos/modules/services/gamemode.nix";
      cfg-warp  = "nano /etc/nixos/modules/services/warp.nix";

      # ╭────────────────────────────╮
      # │ 🟢  MÓDULOS: BOOT          │
      # ╰────────────────────────────╯
      cfg-boot-mod = "nano /etc/nixos/modules/boot/default.nix";
      cfg-boot = "nano /etc/nixos/modules/boot/boot.nix";
      cfg-kernel = "nano /etc/nixos/modules/boot/kernel.nix";

      # ╭────────────────────────────╮
      # │ 🐚  HOME MANAGER: SHELL    │
      # ╰────────────────────────────╯
      hm-shell      = "nano /etc/nixos/home/modules/shell/default.nix";
      hm-aliases    = "nano /etc/nixos/home/modules/shell/aliases.nix";
      hm-fish       = "nano /etc/nixos/home/modules/shell/fish.nix";
      hm-oh-my-posh = "nano /etc/nixos/home/modules/shell/oh-my-posh.nix";

      # ╭────────────────────────────╮
      # │ 🧾  HOME MANAGER: GIT      │
      # ╰────────────────────────────╯
      hm-git       = "nano /etc/nixos/home/modules/git/default.nix";

      # ╭────────────────────────────╮
      # │ 🧰  HOME MANAGER: APPS     │
      # ╰────────────────────────────╯
      hm-apps          = "nano /etc/nixos/home/modules/apps/default.nix";
      hm-menu          = "nano /etc/nixos/home/modules/apps/menu.nix";
      hm-media         = "nano /etc/nixos/home/modules/apps/media.nix";
      hm-vscode        = "nano /etc/nixos/home/modules/apps/vscode.nix";
      hm-firefox       = "nano /etc/nixos/home/modules/apps/firefox/firefox.nix";
      hm-vscode-config = "nano /etc/nixos/vscode/settings.json";
      hm-devtools      = "nano /etc/nixos/home/modules/apps/devtools.nix";
      hm-utilities     = "nano /etc/nixos/home/modules/apps/utilities.nix";

      # ╭────────────────────────────╮
      # │ 🎨  HOME MANAGER: Aparência│
      # ╰────────────────────────────╯
      hm-gnome = "nano /etc/nixos/home/modules/system/gnome.nix";

      # ╭────────────────────────────╮
      # │ 🧱  HOME MANAGER: SYSTEM   │
      # ╰────────────────────────────╯
      hm-system    = "nano /etc/nixos/home/modules/system/default.nix";
      hm-fonts     = "nano /etc/nixos/home/modules/system/fonts.nix";
      hm-variables = "nano /etc/nixos/home/modules/system/variables.nix";

      # ╭────────────────────────────╮
      # │ 📁  GIT TREE /etc/nixos    │
      # ╰────────────────────────────╯
      ns = "cd /etc/nixos && git status";
      np = "cd /etc/nixos && git add -A && gitmoji -c && git push";

      # ╭────────────────────────────╮
      # │ 🐳  Docker                 │
      # ╰────────────────────────────╯
      docker-up   = "docker compose up -d";
      docker-down = "docker compose down";

      # ╭────────────────────────────╮
      # │ 🎮  GPU                    │
      # ╰────────────────────────────╯
      gpu-game    = "sudo systemctl start gpu-power-gaming";
      gpu-normal  = "sudo systemctl start gpu-power-normal";
    };
  };
}
