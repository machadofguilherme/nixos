{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      # Atualiza flake, rebuilda NixOS e aplica Home Manager (modo sistema)
      nix-system-upgrade = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#hostname && sudo home-manager switch --flake /etc/nixos";

      # Apenas rebuild do sistema NixOS
      nix-rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#hostname";

      # Apenas aplica a configuração do Home Manager (modo sistema)
      home-rebuild = "sudo home-manager switch --flake /etc/nixos";

      # Aliases para editar arquivos de configuração no /etc/nixos com sudo
      cfg-system          = "sudo nano /etc/nixos/configuration.nix";
      cfg-flake           = "sudo nano /etc/nixos/flake.nix";

      # Aliases para módulos do NixOS (ajuste conforme seus paths)
      cfg-dev             = "sudo nano /etc/nixos/modules/misc/dev.nix";
      cfg-net             = "sudo nano /etc/nixos/modules/network/net.nix";
      cfg-user            = "sudo nano /etc/nixos/modules/system/user.nix";
      cfg-dns             = "sudo nano /etc/nixos/modules/network/dns.nix";
      cfg-locale          = "sudo nano /etc/nixos/modules/lang/locale.nix";
      cfg-misc            = "sudo nano /etc/nixos/modules/misc/default.nix";
      cfg-lang            = "sudo nano /etc/nixos/modules/lang/default.nix";
      cfg-boot            = "sudo nano /etc/nixos/modules/boot/default.nix";
      cfg-fonts           = "sudo nano /etc/nixos/modules/system/fonts.nix";
      cfg-nix             = "sudo nano /etc/nixos/modules/security/nix.nix";
      cfg-sudo            = "sudo nano /etc/nixos/modules/security/sudo.nix";
      cfg-timezone        = "sudo nano /etc/nixos/modules/lang/timezone.nix";
      cfg-plasma          = "sudo nano /etc/nixos/modules/desktop/plasma.nix";
      cfg-shell           = "sudo nano /etc/nixos/modules/services/shell.nix";
      cfg-print           = "sudo nano /etc/nixos/modules/services/print.nix";
      cfg-audio           = "sudo nano /etc/nixos/modules/services/audio.nix";
      cfg-system-mod      = "sudo nano /etc/nixos/modules/system/default.nix";
      cfg-display         = "sudo nano /etc/nixos/modules/desktop/server.nix";
      cfg-network-mod     = "sudo nano /etc/nixos/modules/network/default.nix";
      cfg-packages        = "sudo nano /etc/nixos/modules/system/packages.nix";
      cfg-desktop         = "sudo nano /etc/nixos/modules/desktop/default.nix";
      cfg-drivers         = "sudo nano /etc/nixos/modules/desktop/drivers.nix";
      cfg-virtual         = "sudo nano /etc/nixos/modules/services/virtual.nix";
      cfg-services        = "sudo nano /etc/nixos/modules/services/default.nix";
      cfg-security        = "sudo nano /etc/nixos/modules/security/default.nix";
      cfg-touchpad        = "sudo nano /etc/nixos/modules/services/touchpad.nix";
      cfg-exclude-plasma  = "sudo nano /etc/nixos/modules/desktop/exclude-plasma.nix";

      # Aliases para arquivos do home-manager dentro de /etc/nixos
      hm-flake            = "sudo nano /etc/nixos/home/flake.nix";
      hm-git-user         = "sudo nano /etc/nixos/home/modules/git/user.nix";
      hm-git-extra        = "sudo nano /etc/nixos/home/modules/git/extra.nix";
      hm-menu             = "sudo nano /etc/nixos/home/modules/apps/menu.nix";
      hm-media            = "sudo nano /etc/nixos/home/modules/apps/media.nix";
      hm-fish             = "sudo nano /etc/nixos/home/modules/shell/fish.nix";
      hm-git              = "sudo nano /etc/nixos/home/modules/git/default.nix";
      hm-apps             = "sudo nano /etc/nixos/home/modules/apps/default.nix";
      hm-fonts            = "sudo nano /etc/nixos/home/modules/system/fonts.nix";
      hm-devtools         = "sudo nano /etc/nixos/home/modules/apps/devtools.nix";
      hm-shell            = "sudo nano /etc/nixos/home/modules/shell/default.nix";
      hm-aliases          = "sudo nano /etc/nixos/home/modules/shell/aliases.nix";
      hm-theme            = "sudo nano /etc/nixos/home/modules/theme/default.nix";
      hm-system           = "sudo nano /etc/nixos/home/modules/system/default.nix";
      hm-utilities        = "sudo nano /etc/nixos/home/modules/apps/utilities.nix";
      hm-oh-my-posh       = "sudo nano /etc/nixos/home/modules/shell/oh-my-posh.nix";
      hm-variables        = "sudo nano /etc/nixos/home/modules/system/variables.nix";
    };
  };
}
