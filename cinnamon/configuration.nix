# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Permite pacote inseguro 'openssl'.
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1v"
  ];
              
  # Permite não-livre.
  nixpkgs.config.allowUnfree = true;

  # Cores.
  nix.settings.cores = 2;

  # Otimiza Store.
  nix.settings.auto-optimise-store = true;

  # Atualiza microcode Intel.
  hardware.cpu.intel.updateMicrocode = true;

  # Bluetooth
  hardware.bluetooth.enable = false;
  hardware.bluetooth.powerOnBoot = false;
  
  # Zsh.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.binsh = "${pkgs.zsh}/bin/zsh";
  programs.zsh.autosuggestions.enable = true;
  environment.variables = {
    EDITOR = "micro";
    SYSTEMD_EDITOR = "micro";
    VISUAL = "micro";
  };
   
  # Permite Flatpak.
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  
  # Auto upgrade.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixpkgs-unstable";

  # Limpeza de "generations".
  nix = {
    gc = {
      automatic = true; 
      dates = "weekly"; 
      options = "--delete-older-than 5d";
    };
  };
  
  # Sudo.
  security.sudo.execWheelOnly = true;
  security.sudo.wheelNeedsPassword = false;
  
  # Docker.
  virtualisation.docker.enable = true;

  # SystemD.
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';
  
  # GRUB.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      enable = true;
    };
    timeout = 3;
  };
  
  # Internet.
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;

  # Fuso-horário.
  time.timeZone = "America/Sao_Paulo";

  # Internacionalização.
  i18n.defaultLocale = "pt_BR.UTF-8";

  # X11.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.xserver.excludePackages = [ pkgs.xterm ];
  hardware.opengl.driSupport32Bit = true;
  
  # Permite Cinnamon.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.slick.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.name = "Bibata-Original-Classic";
  services.xserver.desktopManager.cinnamon.enable = true;
  services.cinnamon.apps.enable = false;
  
  # Aceleração Gráfica.
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Mapa de teclado.
  services.xserver.layout = "br";

  # Áudio.
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;
  
  # Habilita touchpad.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.tapping = true;

  # Conta de usuário.
  users.users.machado = {
     isNormalUser = true;
     extraGroups = [
        "wheel"
        "audio"
        "video"
        "docker"
        "networkmanager"
     ];
     packages = with pkgs; [
      vscode
      nodejs_20
      zoom-us
      caprine-bin
      docker
      docker-compose
      flatpak
      slack
      git
      gh
      steam
      killall
      runescape
      discord-development
      beekeeper-studio
      nodePackages.prisma
      stremio
      insomnia
      unzip
      spotify
      kalker
      obs-studio
      gimp-with-plugins
      onlyoffice-bin
      nodePackages_latest.gitmoji-cli
      gnome.cheese
      cinnamon.xapp
     ];
   };

  # Pacotes.
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs
    brave
    micro
    papirus-icon-theme
    tela-icon-theme
    bibata-cursors
    bibata-cursors-translucent
    nordzy-icon-theme
    gnome.gnome-terminal
  ];

  # Fontes.
  fonts = {
    packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk
      pkgs.noto-fonts-emoji
      pkgs.font-awesome
      pkgs.source-han-sans
      pkgs.source-han-sans-japanese
      pkgs.source-han-serif-japanese
      pkgs.roboto
      pkgs.roboto-mono
      pkgs.ubuntu_font_family
      pkgs.meslo-lgs-nf
    ];
    fontconfig.enable = true;
  };
  
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix
  system.copySystemConfiguration = true;

  # Linux.
  boot.kernelPackages = pkgs.linuxPackages_testing;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
