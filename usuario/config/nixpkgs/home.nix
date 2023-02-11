{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "machado";
  home.homeDirectory = "/home/machado";
  
  # Allow unfree
  nixpkgs.config.allowUnfree = true;
  
  # Fish
  programs.fish.enable = true;
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
      pfetch
    '';
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
   ];
   shellAliases = {
      docker-createdb = "docker run -d -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=root -e MYSQL_PASSWORD=password -v ~/Documentos/databse:/var/lib/mysql -p 3306:3306 --name books_api mysql:8.0.31-debian";
      nix-config = "sudo nano /etc/nixos/configuration.nix";
      nix-rebuild = "sudo nixos-rebuild switch";
      home-nix-config = "nano $HOME/.config/nixpkgs/home.nix";
      home-nix-rebuild = "home-manager -j 4 --cores 4 switch";
      nix-update = "sudo nix-channel --update && nix-rebuild";
      nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nixos-rebuild boot && sudo nix-store --optimise";
   };
  };

  # Packages to install
  home.packages = [
    pkgs.zoom-us
    pkgs.caprine-bin
    pkgs.vscode
    pkgs.docker
    pkgs.docker-compose
    pkgs.flatpak
    pkgs.slack
    pkgs.papirus-icon-theme
    pkgs.pfetch
    pkgs.git
    pkgs.nodejs-16_x
    pkgs.steam
    pkgs.killall
    pkgs.ocs-url
    pkgs.bibata-cursors
    pkgs.bibata-cursors-translucent
    pkgs.tela-icon-theme
    pkgs.grc
    pkgs.gh
    pkgs.gruvbox-dark-gtk
    pkgs.gruvbox-dark-icons-gtk
    pkgs.whitesur-gtk-theme
    pkgs.nordzy-icon-theme
    pkgs.gnome.gnome-tweaks
    pkgs.gnome-console
    pkgs.gnome.eog
    pkgs.gnome.nautilus
    pkgs.gnome-text-editor
    pkgs.evince
  ];
  
  # Other configs
  nixpkgs.config.packageOverrides = pkgs: {
   steam = pkgs.steam.override {
    extraPkgs = pkgs: with pkgs; [
      libgdiplus
    ];
   };

   vaapiIntel = pkgs.vaapiIntel.override {
     enableHybridCodec = true;
   };
  };
   
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";
}
