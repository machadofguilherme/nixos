# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Permite pacote inseguro 'openssl'
  nixpkgs.config.permittedInsecurePackages = [
   "openssl-1.1.1u"
  ];  
              
  # Permite não-livre
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 2;

  # Otimiza Store
  nix.settings.auto-optimise-store = true;

  # Atualiza microcode Intel
  hardware.cpu.intel.updateMicrocode = true;
  
  # Zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.binsh = "${pkgs.zsh}/bin/zsh";
  programs.zsh.autosuggestions.enable = true;
  
  # Permite Flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];

  # Auto upgrade.
  nix.gc.automatic = true;
  nix.gc.dates = "15:00";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixpkgs-unstable";
  
  # Sudo
  security.sudo.execWheelOnly = true;
  security.sudo.wheelNeedsPassword = false;
  
  # Docker
  virtualisation.docker.enable = true;

  # GRUB
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
  services.xserver.displayManager.defaultSession = "plasmawayland";

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    khelpcenter
    print-manager
  ];
  
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
  hardware.pulseaudio.enable = true;
  services.pipewire = {
   enable = false;
   pulse.enable = false;
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
    micro
    zsh
    zsh-powerlevel10k
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
  system.stateVersion = "23.05"; # Did you read the comment?
}
