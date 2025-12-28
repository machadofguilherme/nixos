{ config, pkgs, ... }: {
  programs.fish = {
    shellAliases = {

      # ╭────────────────────────────╮
      # │ 🔄  ATUALIZAÇÃO DO SISTEMA  │
      # ╰────────────────────────────╯
      nix-update-flake = "sudo nix flake update --flake /etc/nixos";
      nix-rebuild        = "sudo nixos-rebuild switch --flake /etc/nixos#hostname";
      nix-system-upgrade = "nix-update-flake && nix-rebuild";

      # ╭─────────────────────────────────────────╮
      # │ 🧹 Limpeza inteligente da Nix Store     │
      # ╰─────────────────────────────────────────╯
      angrr-clean       = "angrr run --period 2d";
      angrr-clean-all   = "sudo angrr run --period 2d --owned-only=false";
      nix-gc            = "sudo nix-collect-garbage --delete-older-than 2d";
      nix-hgc           = "nix-heuristic-gc 20000000000";

      # ╭────────────────────────────╮
      # │ 🛠️  CONFIGS PRINCIPAIS       │
      # ╰────────────────────────────╯
      cfg-system  = "sudo nano /etc/nixos/configuration.nix";
      cfg-flake   = "sudo nano /etc/nixos/flake.nix";

      # ╭────────────────────────────╮
      # │ 🧩  MÓDULOS: SYSTEM         │
      # ╰────────────────────────────╯
      cfg-system-mod = "sudo nano /etc/nixos/system/default.nix";
      cfg-packages   = "sudo nano /etc/nixos/system/packages.nix";
      cfg-fonts      = "sudo nano /etc/nixos/system/fonts.nix";
      cfg-user       = "sudo nano /etc/nixos/system/user.nix";
      cfg-shell      = "sudo nano /etc/nixos/system/shell.nix";

      # ╭────────────────────────────╮
      # │ 🌐  MÓDULOS: NETWORK         │
      # ╰────────────────────────────╯
      cfg-network-mod = "sudo nano /etc/nixos/network/default.nix";
      cfg-net         = "sudo nano /etc/nixos/network/net.nix";
      cfg-dns         = "sudo nano /etc/nixos/network/dns.nix";

      # ╭────────────────────────────╮
      # │ 🌍  MÓDULOS: LANG           │
      # ╰────────────────────────────╯
      cfg-lang     = "sudo nano /etc/nixos/lang/default.nix";
      cfg-locale   = "sudo nano /etc/nixos/lang/locale.nix";
      cfg-timezone = "sudo nano /etc/nixos/lang/timezone.nix";

      # ╭────────────────────────────╮
      # │ 🔐  MÓDULOS: SECURITY       │
      # ╰────────────────────────────╯
      cfg-security = "sudo nano /etc/nixos/security/default.nix";
      cfg-nix      = "sudo nano /etc/nixos/security/nix.nix";
      cfg-sudo     = "sudo nano /etc/nixos/security/sudo.nix";
      cfg-unfree   = "sudo nano /etc/nixos/security/unfree.nix";

      # ╭────────────────────────────╮
      # │ 🖥️  MÓDULOS: GRAPHICAL       │
      # ╰────────────────────────────╯
      cfg-graphical = "sudo nano /etc/nixos/graphical/default.nix";
      cfg-base      = "sudo nano /etc/nixos/graphical/base.nix";
      cfg-drivers   = "sudo nano /etc/nixos/graphical/drivers.nix";
      cfg-environment = "sudo nano /etc/nixos/graphical/environment.nix";
      cfg-portal    = "sudo nano /etc/nixos/graphical/portal.nix";

      # ╭────────────────────────────╮
      # │ ⚙️  MÓDULOS: SERVICES        │
      # ╰────────────────────────────╯
      cfg-services  = "sudo nano /etc/nixos/services/default.nix";
      cfg-audio     = "sudo nano /etc/nixos/services/audio.nix";
      cfg-print     = "sudo nano /etc/nixos/services/print.nix";
      cfg-touchpad  = "sudo nano /etc/nixos/services/touchpad.nix";
      cfg-docker    = "sudo nano /etc/nixos/services/docker.nix";
      cfg-gamemode  = "sudo nano /etc/nixos/services/gamemode.nix";

      # ╭────────────────────────────╮
      # │ 🐚  HOME MANAGER: SHELL       │
      # ╰────────────────────────────╯
      hm-shell      = "nano /etc/nixos/home/shell/default.nix";
      hm-aliases    = "nano /etc/nixos/home/shell/aliases.nix";
      hm-fish       = "nano /etc/nixos/home/shell/fish.nix";
      hm-oh-my-posh = "nano /etc/nixos/home/shell/oh-my-posh.nix";

      # ╭────────────────────────────╮
      # │ 🧾  HOME MANAGER: GIT         │
      # ╰────────────────────────────╯
      hm-git       = "nano /etc/nixos/home/git/default.nix";

      # ╭────────────────────────────╮
      # │ 🧰  HOME MANAGER: APPS        │
      # ╰────────────────────────────╯
      hm-apps      = "nano /etc/nixos/home/apps/default.nix";
      hm-menu      = "nano /etc/nixos/home/apps/menu.nix";
      hm-media     = "nano /etc/nixos/home/apps/media.nix";
      hm-devtools  = "nano /etc/nixos/home/apps/devtools.nix";
      hm-utilities = "nano /etc/nixos/home/apps/utilities.nix";

      # ╭────────────────────────────╮
      # │ 🎨  HOME MANAGER: GNOME       │
      # ╰────────────────────────────╯
      hm-gnome     = "nano /etc/nixos/home/system/gnome.nix";

      # ╭────────────────────────────╮
      # │ 🧱  HOME MANAGER: SYSTEM      │
      # ╰────────────────────────────╯
      hm-system    = "nano /etc/nixos/home/system/default.nix";
      hm-fonts     = "nano /etc/nixos/home/system/fonts.nix";
      hm-variables = "nano /etc/nixos/home/system/variables.nix";

      # ╭────────────────────────────╮
      # │ 📁  GIT TREE /etc/nixos      │
      # ╰────────────────────────────╯
      ns = "cd /etc/nixos && git status";
      np = "cd /etc/nixos && git add -A && gitmoji -c && git push";

      # ╭────────────────────────────╮
      # │ 🐳  Docker                    │
      # ╰────────────────────────────╯
      docker-up   = "docker compose up -d";
      docker-down = "docker compose down";
    };
  };
}
