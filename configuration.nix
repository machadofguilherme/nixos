# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Permite não-livre
  nixpkgs.config.allowUnfree = true;

  # Otimiza Store
  nix.settings.auto-optimise-store = true;
  
  # Zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.binsh = "${pkgs.zsh}/bin/zsh";
  programs.zsh.shellAliases = {
      docker-createdb = "docker run -d -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=root -e MYSQL_PASSWORD=password -v ~/Documentos/databse:/var/lib/mysql -p 3306:3306 --name books_api mysql:8.0.31-debian";
      nix-config = "sudo micro /etc/nixos/configuration.nix";
      nix-rebuild = "sudo nixos-rebuild switch";
      home-nix-config = "micro $HOME/.config/nixpkgs/home.nix";
      home-nix-rebuild = "home-manager -j 4 --cores 4 switch";
      nix-update = "sudo nix-channel --update && nix-rebuild";
      nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --gc && sudo nixos-rebuild boot && sudo nix-store --optimise";
   };

  # Permite Flatpak
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];

  # Auto upgrade.
  nix.gc.automatic = true;
  nix.gc.dates = "15:00";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixpkgs-unstable";
  
  # Apenas wheel
  security.sudo.execWheelOnly = true;

  # Docker
  virtualisation.docker.enable = true;

  # GRUB
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
      version = 2;
      enable = true;
    };
    timeout = 3;
  };
  
  # Internet
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;

  # Fuso-horário
  time.timeZone = "America/Sao_Paulo";

  # Internacionalização
  i18n.defaultLocale = "pt_BR.UTF-8";

  # X11
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.xserver.excludePackages = [ pkgs.xterm ];
  hardware.opengl.driSupport32Bit = true;
  
  # Permite Plasma
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Permite GNOME
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  # services.gnome.core-utilities.enable = false;

  # Aceleração Gráfica
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Mapa de teclado
  services.xserver.layout = "br";

  # Áudio
  hardware.pulseaudio.enable = false;
  services.pipewire = {
   enable = true;
   pulse.enable = true;
  };

  # Habilita touchpad
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = true;

  # Conta de usuário
  users.users.machado = {
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "video" "docker" "networkmanager" ];
     packages = with pkgs; [
      vscode
      nodejs_20
      mysql-workbench
      zoom-us
      caprine-bin
      docker
      docker-compose
      flatpak
      slack
      git
      steam
      killall
      runescape
      discord-development
     ];
   };

  # Pacotes
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs
    papirus-icon-theme
    tela-icon-theme
    bibata-cursors
    bibata-cursors-translucent
    nordzy-icon-theme
    roboto
    roboto-mono
    ubuntu_font_family
    meslo-lgs-nf
    micro
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix
  system.copySystemConfiguration = true;

  # Linux
  boot.kernelPackages = pkgs.linuxPackages_testing;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "23.05"; # Did you read the comment?
  system.stateVersion = "unstable";
}