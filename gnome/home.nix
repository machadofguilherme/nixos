{ config, pkgs, ... }:

{
  home.username = "guilherme";
  home.stateVersion = "24.05";
  home.homeDirectory = "/home/guilherme";

  programs.fish.enable = true;
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.enableBashIntegration = true;                                                                  
  programs.oh-my-posh.useTheme = "blue-owl";
  
  programs.fish.interactiveShellInit = ''
    set -g fish_greeting ""
    ${pkgs.pfetch}/bin/pfetch
  '';

  programs.fish.shellAliases = {
    home-rebuild = "home-manager switch";
    nix-list-installed = "sudo nix-env -q";
    nix-rebuild = "sudo nixos-rebuild switch";
    nix-list-profiles = "sudo nix profile list";
    nix-upgrade = "sudo nixos-rebuild switch --upgrade";
    nix-config = "sudo nano /etc/nixos/configuration.nix";
    nix-clean = "sudo nix-collect-garbage --delete-older-than 7d";
    home-config = "nano ${config.home.homeDirectory}/.config/home-manager/home.nix";
  };

  home.packages = with pkgs; [
    pfetch
    yt-dlp
    fira-code
    oh-my-posh
    meslo-lgs-nf
    fira-code-symbols
    vscode
    nodejs_23
    zoom-us
    caprine-bin
    docker
    docker-compose
    flatpak
    git
    gh
    killall
    insomnia
    unzip
    gimp-with-plugins
    onlyoffice-bin
    gitmoji-cli
    inkscape-with-extensions
    tree
    bun
    skypeforlinux
  ];

  home.sessionVariables = {
    EDITOR = "nano";
  };

  programs.home-manager.enable = true;
}
