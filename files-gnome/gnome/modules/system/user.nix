{ config, pkgs, ... }: {
  # Conta de usuário
  users.users.guilherme.isNormalUser = true;
  users.users.guilherme.extraGroups = [ 
    "wheel" 
    "audio" 
    "video" 
    "docker" 
    "networkmanager" 
  ];
}
