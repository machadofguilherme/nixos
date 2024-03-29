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
    "openssl-1.1.1v"
  ];
              
  # Permite não-livre
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 4;

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
  
  # Auto upgrade.
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
  
  # Permite GNOME
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.gnome-browser-connector.enable = true;
  services.gnome.gnome-initial-setup.enable = true;
  services.gnome.core-os-services.enable = true;
  services.gnome.core-utilities.enable = true;
  services.gnome.core-shell.enable = true;
  programs.file-roller.enable = true;
  programs.evince.enable = true;

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
  nixpkgs.config.pulseaudio = true;
  
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
      nodePackages_latest.gitmoji-cli
      gnome.cheese
     ];
   };

  # Pacotes
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    (opera.override { proprietaryCodecs = true; })
    vivaldi-ffmpeg-codecs
    roboto
    roboto-mono
    ubuntu_font_family
    meslo-lgs-nf
    micro
    gnomeExtensions.appindicator
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
