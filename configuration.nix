# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;  
  boot.loader.efi.canTouchEfiVariables = true;

  # Rede.
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;

  # Fuso-horário.
  time.timeZone = "America/Sao_Paulo";

  # Idioma.
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "br-abnt2";
     # useXkbConfig = true;
  };

  # X11.
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };
    displayManager = {
      gdm.enable = true;
    };
  };

  # Flatpak.
  services.flatpak.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # ZSH.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.machado.shell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];  

  # Teclado(X11).
  services.xserver.layout = "br";
  #services.xserver.xkbVariant = "abnt2";
  
  # Impressora.
  services.printing.enable = false;

  # Áudio.
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
};

  # Touchpad.
  services.xserver.libinput.enable = true;

  # Usuário.
   users.users.machado = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       firefox-devedition-bin
       git
       nodejs
    ];
   };
   security.sudo.wheelNeedsPassword = false;

  # Lista pacotes instalados no perfil do sistema. Para pesquisar, rode:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   	zoom-us
	vscode
        slack
        flatpak
        zsh
        zsh-history-substring-search
        zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-powerlevel10k
	meslo-lgs-nf
	stremio
  ];

  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
   };
  
  # Pacotes GNOME desnecessários.
  environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
]) ++ (with pkgs.gnome; [
  gnome-music
  gnome-calendar
  gnome-clocks
  gnome-contacts
  gnome-logs
  gnome-music
  gnome-terminal
  simple-scan
  pkgs.gnome-photos
  gnome-weather
  gnome-software
  gnome-terminal
  gedit
  epiphany
  geary
  gnome-characters
  totem
  tali
  iagno
  hitori
  atomix
]);
  
  # Cópia de configuration.nix.
  system.copySystemConfiguration = true;

  # Define stateVersion.
  system.stateVersion = "22.05";

}
