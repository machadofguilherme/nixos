{ config, pkgs, ... }: {
  users.users.guilherme = {
    isNormalUser = true;
    description = "Guilherme Machado";
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "docker"
      "networkmanager"
    ];
  };
}
