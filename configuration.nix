# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  cus_vivaldi = pkgs.vivaldi.overrideAttrs (oldAttrs: {
    dontWrapQtApps = false;
    dontPatchELF = true;
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ];
  });
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  programs.direnv.enable = true;

  # SSH
  programs.ssh.startAgent = true;
  programs.ssh.enableAskPassword = false;

  # Experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
            
  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 16;

  # Otimiza Store
  nix.settings.auto-optimise-store = true;

  # Atualiza microcode AMD
  hardware.cpu.amd.updateMicrocode = true;
  
  # Zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  environment.binsh = "${pkgs.zsh}/bin/zsh";
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.enableLsColors = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.syntaxHighlighting.highlighters = [ "main" "brackets" ];
  programs.nix-index.enableZshIntegration = true;
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  programs.zsh.shellAliases = {
    nix-upgrade = "sudo nixos-rebuild switch --upgrade && sudo nix-collect-garbage -d";
    nix-config = "sudo nano /etc/nixos/configuration.nix";
    nix-rebuild = "sudo nixos-rebuild switch";
    nix-list-profiles = "sudo nix profile list";
    nix-list-installed = "sudo nix-env -q";
  };

  # Permite Flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;
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

  # X11
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.excludePackages = [ pkgs.xterm ];

  hardware.graphics.extraPackages = with pkgs; [
   amdvlk
  ];
  
  hardware.graphics.extraPackages32 = with pkgs; [
   driversi686Linux.amdvlk
  ];
  
  # Permite Plasma
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.wayland.compositor = "kwin";
  services.desktopManager.plasma6.enable = true;

   environment.plasma6.excludePackages = [
    pkgs.kdePackages.elisa
    pkgs.kdePackages.khelpcenter
    pkgs.kdePackages.print-manager
  ];
  
  # Aceleração Gráfica
  hardware.graphics.enable = true;

  # Mapa de teclado
  services.xserver.xkb.layout = "br";

  # Áudio
  hardware.pulseaudio.enable = false;
  services.pipewire = {
   enable = true;
   pulse.enable = true;
  };

  # Habilita touchpad
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true;

  # Conta de usuário
  users.users.guilherme = {
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
      git
      gh
      killall
      insomnia
      unzip
      kalker
      gimp-with-plugins
      onlyoffice-bin
      gitmoji-cli
      inkscape-with-extensions
      yt-dlp
      tree
      bun
      skypeforlinux
     ];
   };

  # Pacotes
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    qt6.qtwayland
    cus_vivaldi
    vivaldi-ffmpeg-codecs
    micro
    zsh
    zsh-powerlevel10k
    kdePackages.plasma-browser-integration
    keychain
    pfetch
    openssl

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    roboto
    roboto-mono
    ubuntu_font_family
    meslo-lgs-nf
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
