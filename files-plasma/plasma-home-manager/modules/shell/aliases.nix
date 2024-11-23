{ config, pkgs, ... }: {
  # Aliases do Fish
  programs = {
    fish = {
      shellAliases = {
        nix-list-installed  = "sudo nix-env -q";
        home-rebuild        = "home-manager switch";
        nix-list-profiles   = "sudo nix profile list";
        nix-flake           = "sudo nano /etc/nixos/flake.nix";
        home-clean          = "home-manager expire-generations -d";
        nix-config          = "sudo nano /etc/nixos/configuration.nix";
        nix-clean           = "sudo nix-collect-garbage --delete-older-than 3d";
        nix-rebuild         = "sudo nixos-rebuild switch --flake /etc/nixos#hostname";
        home-config         = "nano ${config.home.homeDirectory}/.config/home-manager/home.nix";
        nix-upgrade         = "sudo nix flake update --flake /etc/nixos/ && sudo nixos-rebuild switch --flake /etc/nixos#hostname";
        homem-upgrade       = "nix flake update --flake ${config.home.homeDirectory}/.config/home-manager/ && home-manager switch";

        # Aliases para os módulos de configuração
        cfg-dev             = "sudo nano /etc/nixos/modules/misc/dev.nix";
        cfg-nano            = "sudo nano /etc/nixos/modules/misc/config.nix";
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
        cfg-system          = "sudo nano /etc/nixos/modules/system/default.nix";
        cfg-display         = "sudo nano /etc/nixos/modules/desktop/server.nix";
        cfg-network         = "sudo nano /etc/nixos/modules/network/default.nix";
        cfg-packages        = "sudo nano /etc/nixos/modules/system/packages.nix";
        cfg-desktop         = "sudo nano /etc/nixos/modules/desktop/default.nix";
        cfg-drivers         = "sudo nano /etc/nixos/modules/desktop/drivers.nix";
        cfg-virtual         = "sudo nano /etc/nixos/modules/services/virtual.nix";
        cfg-services        = "sudo nano /etc/nixos/modules/services/default.nix";
        cfg-security        = "sudo nano /etc/nixos/modules/security/default.nix";
        cfg-touchpad        = "sudo nano /etc/nixos/modules/services/touchpad.nix";
        cfg-exclude-plasma  = "sudo nano /etc/nixos/modules/desktop/exclude-plasma.nix";

        # Aliases para os módulos de configuração Home Manager
        hm-flake            = "nano ${config.home.homeDirectory}/.config/home-manager/flake.nix";
        hm-git-user         = "nano ${config.home.homeDirectory}/.config/home-manager/modules/git/user.nix";
        hm-git-extra        = "nano ${config.home.homeDirectory}/.config/home-manager/modules/git/extra.nix";
        hm-menu             = "nano ${config.home.homeDirectory}/.config/home-manager/modules/apps/menu.nix";
        hm-media            = "nano ${config.home.homeDirectory}/.config/home-manager/modules/apps/media.nix";
        hm-fish             = "nano ${config.home.homeDirectory}/.config/home-manager/modules/shell/fish.nix";
        hm-git              = "nano ${config.home.homeDirectory}/.config/home-manager/modules/git/default.nix";
        hm-apps             = "nano ${config.home.homeDirectory}/.config/home-manager/modules/apps/default.nix";
        hm-fonts            = "nano ${config.home.homeDirectory}/.config/home-manager/modules/system/fonts.nix";
        hm-devtools         = "nano ${config.home.homeDirectory}/.config/home-manager/modules/apps/devtools.nix";
        hm-shell            = "nano ${config.home.homeDirectory}/.config/home-manager/modules/shell/default.nix";
        hm-aliases          = "nano ${config.home.homeDirectory}/.config/home-manager/modules/shell/aliases.nix";
        hm-system           = "nano ${config.home.homeDirectory}/.config/home-manager/modules/system/default.nix";
        hm-utilities        = "nano ${config.home.homeDirectory}/.config/home-manager/modules/apps/utilities.nix";
        hm-oh-my-posh       = "nano ${config.home.homeDirectory}/.config/home-manager/modules/shell/oh-my-posh.nix";
        hm-variables        = "nano ${config.home.homeDirectory}/.config/home-manager/modules/system/variables.nix";
      };
    };
  };
}
