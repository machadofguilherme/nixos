{ config, pkgs, ... }: {
  # Aliases do Fish
  programs = {
    fish = {
      shellAliases = {
        nix-list-installed  = "sudo nix-env -q";
        home-rebuild        = "home-manager switch";
        nix-list-profiles   = "sudo nix profile list";
        nix-rebuild         = "sudo nixos-rebuild switch";
        nix-upgrade         = "sudo nixos-rebuild switch --upgrade";
        nix-config          = "sudo nano /etc/nixos/configuration.nix";
        nix-clean           = "sudo nix-collect-garbage --delete-older-than 7d";
        home-config         = "nano ${config.home.homeDirectory}/.config/home-manager/home.nix";

        # Aliases para os módulos de configuração
        cfg-dev             = "sudo nano /etc/nixos/modules/misc/dev.nix";
        cfg-net             = "sudo nano /etc/nixos/modules/network/net.nix";
        cfg-dns             = "sudo nano /etc/nixos/modules/network/dns.nix";
        cfg-locale          = "sudo nano /etc/nixos/modules/lang/locale.nix";
        cfg-misc            = "sudo nano /etc/nixos/modules/misc/default.nix";
        cfg-lang            = "sudo nano /etc/nixos/modules/lang/default.nix";
        cfg-boot            = "sudo nano /etc/nixos/modules/boot/default.nix";
        cfg-fonts           = "sudo nano /etc/nixos/modules/system/fonts.nix";
        cfg-gnome           = "sudo nano /etc/nixos/modules/desktop/gnome.nix";
        cfg-shell           = "sudo nano /etc/nixos/modules/services/shell.nix";
        cfg-print           = "sudo nano /etc/nixos/modules/services/print.nix";
        cfg-audio           = "sudo nano /etc/nixos/modules/services/audio.nix";
        cfg-system          = "sudo nano /etc/nixos/modules/system/default.nix";
        cfg-packages        = "sudo nano /etc/nixos/modules/system/packages.nix";
        cfg-desktop         = "sudo nano /etc/nixos/modules/desktop/default.nix";
        cfg-drivers         = "sudo nano /etc/nixos/modules/desktop/drivers.nix";
        cfg-virtual         = "sudo nano /etc/nixos/modules/services/virtual.nix";
        cfg-touchpad        = "sudo nano /etc/nixos/modules/services/touchpad.nix";
        cfg-exclude-gnome   = "sudo nano /etc/nixos/modules/desktop/exclude-gnome.nix";

        # Aliases para os módulos de configuração Home Manager
        hm-git-user         = "nano ${config.home.homeDirectory}/.config/home-manager/modules/git/user.nix";
        hm-git-extra        = "nano ${config.home.homeDirectory}/.config/home-manager/modules/git/extra.nix";
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
