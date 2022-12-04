# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Optimise Store
  nix.settings.auto-optimise-store = true;
  
  # ZSH
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.binsh = "${pkgs.zsh}/bin/zsh";

  # Oh My ZSH
  programs.zsh = {
   autosuggestions.enable = true;
   autosuggestions.async = true;
   enableCompletion = true;
   enableGlobalCompInit = true;
   syntaxHighlighting.enable = true;
   ohMyZsh = {
    enable = true;
    plugins = [ "git" "thefuck" ];
    theme = "wezm";
   };
  };
  
  # Allow Flatpak
  services.flatpak.enable = true;

  # Auto upgrade.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
  
  # Only wheel
  security.sudo.execWheelOnly = true;

  # Docker
  virtualisation.docker.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 3;
  
  # Network
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.desktopManager.xterm.enable = false;
  hardware.opengl.driSupport32Bit = true;
  
  # Enable Plasma.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.desktopManager.plasma5.excludePackages = with pkgs.libsForQt5; [
   elisa
   oxygen
   khelpcenter
   print-manager
  ];
  
  # Graphic Acceleration
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # GNOME
  # environment.gnome.excludePackages = (with pkgs; [
  #  gnome-photos
  #  gnome-tour
  # ]) ++ (with pkgs.gnome; [
  # gnome-music
  # gnome-terminal
  # gedit # text editor
  # epiphany # web browser
  # geary # email reader
  # gnome-characters
  # totem # video player
  # tali # poker game
  # iagno # go game
  # hitori # sudoku game
  # atomix # puzzle game
  # gnome-calendar
  # gnome-contacts
  # gnome-clocks
  # epiphany
  # simple-scan
  # gnome-logs
  # gnome-font-viewer
  # baobab
  # pkgs.gnome-connections
  # gnome-software
  # ]);

  # Configure keymap in X11
  services.xserver.layout = "br";

  # Enable sound.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
   enable = true;
   pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.machado = {
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "video" "docker" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
      # 
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   konsole  
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix
  system.copySystemConfiguration = true;

  # Kernel parameters
  # boot.kernelParams = [ "quiet" ];

  # Linux kernel
  boot.kernelPackages = pkgs.linuxPackages_testing;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

