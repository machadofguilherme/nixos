{ config, pkgs, ... }:

{
  home.username = "guilherme";
  home.stateVersion = "24.05";
  home.homeDirectory = "/home/guilherme";

  # Ativação de Programas Essenciais
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting ""
        ${pkgs.pfetch}/bin/pfetch
      '';
      shellAliases = {
        home-rebuild = "home-manager switch";
        nix-list-installed = "sudo nix-env -q";
        nix-rebuild = "sudo nixos-rebuild switch";
        nix-list-profiles = "sudo nix profile list";
        nix-upgrade = "sudo nixos-rebuild switch --upgrade";
        nix-config = "sudo nano /etc/nixos/configuration.nix";
        nix-clean = "sudo nix-collect-garbage --delete-older-than 7d";
        home-config = "nano ${config.home.homeDirectory}/.config/home-manager/home.nix";
      };
    };

   # Oh-My-Posh com Tema
   oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    useTheme = "blue-owl";
    };
  };

  # Git
  programs.git = {
   enable = true;
   userName = "Guilherme Machado";
   userEmail = "machadofguilherme@proton.me";
   extraConfig = {
     init.defaultBranch = "main";
     safe.directory = "${config.home.homeDirectory}/www";
   };
  };

  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Pacotes de Desenvolvimento e Ferramentas Gerais
  home.packages = with pkgs; [
    nodejs
    pfetch
    yt-dlp
    vscode
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
    fira-code
    meslo-lgs-nf
    fira-code-symbols
  ];
  
  # Configuração das fontes padrão para emoji e monospace
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "MesloLGS NF Bold" ];
  };

  # Variáveis de Sessão (Editor padrão)
  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Home Manager
  programs.home-manager.enable = true;
}
