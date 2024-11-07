# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Permite direnv
  programs.direnv.enable = true;

  # SSH
  programs.ssh.startAgent = true;
  programs.ssh.enableAskPassword = false;

  # Fish
  programs.fish.enable = true;

  # Experimental
  nix.settings.experimental-features = [ "nix-command" ];
            
  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 16;

  # Otimiza Store
  nix.settings.auto-optimise-store = true;

  # Atualiza microcode AMD
  hardware.cpu.amd.updateMicrocode = true;

  # Permite Flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];

  # Sudo
  security.sudo.execWheelOnly = true;
  security.sudo.wheelNeedsPassword = false;

  # Docker
  virtualisation.docker.enable = true;
  
  # GRUB
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.enable = true;
  boot.loader.timeout = 3;
  
  # Internet
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";

  # DNS
  networking.nameservers = [
    "1.1.1.2"
    "8.8.8.8"
    "8.8.4.4"
  ];

  # Fuso-horário
  time.timeZone = "America/Sao_Paulo";

  # Internacionalização
  i18n.defaultLocale = "pt_BR.UTF-8";

  # Servidor gráfico
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Driver
  hardware.graphics.extraPackages = with pkgs; [
   amdvlk
  ];

  hardware.graphics.extraPackages32 = with pkgs; [
   driversi686Linux.amdvlk
  ];
  
  # Permite GNOME
  services.gnome.core-shell.enable = true;
  services.displayManager.defaultSession = "gnome";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Exclui pacotes do GNOME
  environment.gnome.excludePackages = (with pkgs; [
    gnome-software
    gnome-contacts
    gnome-calendar
    gnome-console
    gnome-photos
    simple-scan
    gnome-music
    gnome-tour
    hitori
    atomix
    geary
    totem
    iagno
    tali
    yelp
  ]);
  
  # Aceleração Gráfica
  hardware.graphics.enable = true;

  # Mapa de teclado
  services.xserver.xkb.layout = "br";

  # Áudio
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # Impressora
  services.printing.enable = false;

  # Habilita touchpad
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true;

  # Conta de usuário
  users.users.guilherme.isNormalUser = true;
  users.users.guilherme.extraGroups = [ 
    "wheel" 
    "audio" 
    "video" 
    "docker" 
    "networkmanager" 
  ];

  # Aplicações
  environment.systemPackages = with pkgs; [
    vivaldi-ffmpeg-codecs
    blackbox-terminal
    gnome-text-editor
    keychain
    vivaldi
    openssl
    loupe
  ];

  # Fontes
  fonts.packages = with pkgs; [
    roboto
    dina-font
    noto-fonts
    roboto-mono
    proggyfonts
    noto-fonts-emoji
    ubuntu_font_family
    noto-fonts-cjk-sans
    mplus-outline-fonts.githubRelease
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix
  system.copySystemConfiguration = true;

  # Linux
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
