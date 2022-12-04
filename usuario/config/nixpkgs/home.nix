{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "machado";
  home.homeDirectory = "/home/machado";
  
  # Bash
  #programs.bash = {
  #  enable = true;
  #  bashrcExtra = ''
  #    . ~/.oldbashrc
  #  '';
  #};

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Packages to install
  home.packages = [
    # pkgs is the set of all packages in the default home.nix implementation
    pkgs.nano
    pkgs.caprine-bin
    pkgs.vscode
    pkgs.vivaldi
    pkgs.vivaldi-ffmpeg-codecs
    pkgs.zoom-us
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
    pkgs.pavucontrol
    pkgs.beekeeper-studio
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
