{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {

      # ╭────────────────────────────╮
      # │ 🔄  ATUALIZAÇÃO DO SISTEMA  │
      # ╰────────────────────────────╯
      nix-update-flake = "sudo nix flake update --flake /etc/nixos";
      nix-rebuild        = "sudo nixos-rebuild switch --flake /etc/nixos#hostname";
      nix-system-upgrade = "nix-update-flake && nixos-rebuild";

      # ╭────────────────────────────╮
      # │ 🛠️  CONFIGS PRINCIPAIS       │
      # ╰────────────────────────────╯
      cfg-system  = "sudo nano /etc/nixos/configuration.nix";
      cfg-flake   = "sudo nano /etc/nixos/flake.nix";

      # ╭────────────────────────────╮
      # │ 🧩  MÓDULOS: SISTEMA         │
      # ╰────────────────────────────╯
      cfg-system-mod = "sudo nano /etc/nixos/modules/system/default.nix";
      cfg-packages   = "sudo nano /etc/nixos/modules/system/packages.nix";
      cfg-fonts      = "sudo nano /etc/nixos/modules/system/fonts.nix";
      cfg-user       = "sudo nano /etc/nixos/modules/system/user.nix";

      # ╭────────────────────────────╮
      # │ 🌐  MÓDULOS: REDE            │
      # ╰────────────────────────────╯
      cfg-network-mod = "sudo nano /etc/nixos/modules/network/default.nix";
      cfg-net         = "sudo nano /etc/nixos/modules/network/net.nix";
      cfg-dns         = "sudo nano /etc/nixos/modules/network/dns.nix";

      # ╭────────────────────────────╮
      # │ 🌍  MÓDULOS: IDIOMA/LOCAL    │
      # ╰────────────────────────────╯
      cfg-lang     = "sudo nano /etc/nixos/modules/lang/default.nix";
      cfg-locale   = "sudo nano /etc/nixos/modules/lang/locale.nix";
      cfg-timezone = "sudo nano /etc/nixos/modules/lang/timezone.nix";

      # ╭────────────────────────────╮
      # │ 🔐  MÓDULOS: SEGURANÇA       │
      # ╰────────────────────────────╯
      cfg-security = "sudo nano /etc/nixos/modules/security/default.nix";
      cfg-nix      = "sudo nano /etc/nixos/modules/security/nix.nix";
      cfg-sudo     = "sudo nano /etc/nixos/modules/security/sudo.nix";

      # ╭────────────────────────────╮
      # │ 🖥️  MÓDULOS: INTERFACE       │
      # ╰────────────────────────────╯
      cfg-desktop        = "sudo nano /etc/nixos/modules/desktop/default.nix";
      cfg-plasma         = "sudo nano /etc/nixos/modules/desktop/plasma.nix";
      cfg-display        = "sudo nano /etc/nixos/modules/desktop/server.nix";
      cfg-drivers        = "sudo nano /etc/nixos/modules/desktop/drivers.nix";
      cfg-exclude-plasma = "sudo nano /etc/nixos/modules/desktop/exclude-plasma.nix";

      # ╭────────────────────────────╮
      # │ ⚙️  MÓDULOS: SERVIÇOS        │
      # ╰────────────────────────────╯
      cfg-services  = "sudo nano /etc/nixos/modules/services/default.nix";
      cfg-shell     = "sudo nano /etc/nixos/modules/services/shell.nix";
      cfg-audio     = "sudo nano /etc/nixos/modules/services/audio.nix";
      cfg-print     = "sudo nano /etc/nixos/modules/services/print.nix";
      cfg-touchpad  = "sudo nano /etc/nixos/modules/services/touchpad.nix";
      cfg-virtual   = "sudo nano /etc/nixos/modules/services/virtual.nix";

      # ╭────────────────────────────╮
      # │ 🧪  MÓDULOS: MISCELÂNEA      │
      # ╰────────────────────────────╯
      cfg-misc = "sudo nano /etc/nixos/modules/misc/default.nix";
      cfg-dev  = "sudo nano /etc/nixos/modules/misc/dev.nix";

      # ╭────────────────────────────╮
      # │ 🐚  HM: SHELL                │
      # ╰────────────────────────────╯
      hm-shell      = "sudo nano /etc/nixos/home/modules/shell/default.nix";
      hm-aliases    = "sudo nano /etc/nixos/home/modules/shell/aliases.nix";
      hm-fish       = "sudo nano /etc/nixos/home/modules/shell/fish.nix";
      hm-oh-my-posh = "sudo nano /etc/nixos/home/modules/shell/oh-my-posh.nix";

      # ╭────────────────────────────╮
      # │ 🧾  HM: GIT                  │
      # ╰────────────────────────────╯
      hm-git       = "sudo nano /etc/nixos/home/modules/git/default.nix";
      hm-git-user  = "sudo nano /etc/nixos/home/modules/git/user.nix";
      hm-git-extra = "sudo nano /etc/nixos/home/modules/git/extra.nix";

      # ╭────────────────────────────╮
      # │ 🧰  HM: APLICATIVOS          │
      # ╰────────────────────────────╯
      hm-apps      = "sudo nano /etc/nixos/home/modules/apps/default.nix";
      hm-menu      = "sudo nano /etc/nixos/home/modules/apps/menu.nix";
      hm-media     = "sudo nano /etc/nixos/home/modules/apps/media.nix";
      hm-devtools  = "sudo nano /etc/nixos/home/modules/apps/devtools.nix";
      hm-utilities = "sudo nano /etc/nixos/home/modules/apps/utilities.nix";

      # ╭────────────────────────────╮
      # │ 🎨  HM: TEMA                 │
      # ╰────────────────────────────╯
      hm-theme = "sudo nano /etc/nixos/home/modules/theme/default.nix";

      # ╭────────────────────────────╮
      # │ 🧱  HM: SISTEMA              │
      # ╰────────────────────────────╯
      hm-system    = "sudo nano /etc/nixos/home/modules/system/default.nix";
      hm-fonts     = "sudo nano /etc/nixos/home/modules/system/fonts.nix";
      hm-variables = "sudo nano /etc/nixos/home/modules/system/variables.nix";
    };
  };
}
